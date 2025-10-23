# This application provides a unified interface for image captioning using the BLIP model.
# Users can choose to generate captions from two sources:
# 1. Local files (single or multiple images in a batch).
# 2. Images scraped from a provided web URL (using BeautifulSoup).
# The results are returned as formatted text.

import gradio as gr
import numpy as np
from PIL import Image
from transformers import AutoProcessor, BlipForConditionalGeneration
from io import BytesIO
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin # Added for robust relative URL resolution
import os

# --- 1. Model Initialization (BLIP Base Model) ---
try:
    processor = AutoProcessor.from_pretrained("Salesforce/blip-image-captioning-base")
    model = BlipForConditionalGeneration.from_pretrained("Salesforce/blip-image-captioning-base")
except Exception as e:
    # Handle environment where model loading might fail (e.g., no internet or resource limits)
    print(f"Error loading BLIP model: {e}")
    # Define placeholder objects if model loading is critical for local testing
    processor, model = None, None

# --- 2. Core Captioning Logic ---

def generate_caption_for_image(raw_image: Image.Image, prompt: str = "") -> str:
    """Generates a caption for a single PIL Image."""
    if processor is None or model is None:
         return "Error: Image captioning model failed to load."

    raw_image = raw_image.convert('RGB')
    
    # Use conditional generation if a prompt is provided, otherwise use unconditional
    if prompt.strip():
        inputs = processor(images=raw_image, text=prompt, return_tensors="pt")
    else:
        # Use an empty string prompt for unconditional captioning if the model requires a text input
        # BLIP base model often performs better with an empty prompt for unconditional captioning
        inputs = processor(images=raw_image, return_tensors="pt") 

    out = model.generate(**inputs, max_new_tokens=50)
    caption = processor.decode(out[0], skip_special_tokens=True)
    return caption.strip().capitalize()

# --- 3. Unified Gradio Function ---

def unified_captioner(
    input_method: str,
    local_image_files, # Consolidated input for single or batch uploads
    web_url: str,
    caption_prompt: str
):
    """Routes the request based on the chosen input method."""
    results = []
    
    # --- Input Method 1: Local File Upload (handles single or multiple files) ---
    if input_method == "Local File Upload":
        if not local_image_files:
            return "Please upload one or more image files for processing."
        
        results.append(f"### Image Processing Results ({len(local_image_files)} Image{'s' if len(local_image_files) > 1 else ''})")
        for file_info in local_image_files:
            try:
                # Gradio passes a list of file paths/objects
                raw_image = Image.open(file_info.name)
                caption = generate_caption_for_image(raw_image, caption_prompt)
                results.append(f"- **{os.path.basename(file_info.name)}:** {caption}")
            except Exception as e:
                results.append(f"- **{os.path.basename(file_info.name)}:** *Error processing image: {e}*")

    # --- Input Method 2: Web URL Scraping ---
    elif input_method == "Image URL (Scraping)":
        if not web_url.strip():
            return "Please provide a valid web URL for scraping."
        
        try:
            headers = {"User-Agent": "Mozilla/5.0"}
            response = requests.get(web_url, headers=headers, timeout=15)
            response.raise_for_status() # Raise HTTPError for bad responses (4xx or 5xx)
            
            soup = BeautifulSoup(response.text, "html.parser")
            img_elements = soup.find_all("img")
            
            if not img_elements:
                 results.append(f"No <img> tags found on {web_url}.")
            else:
                results.append(f"### Scraped Image Results from: {web_url} ({len(img_elements)} found)")
                
                processed_count = 0
                for img_element in img_elements:
                    img_url = img_element.get("src") or img_element.get("data-src")
                    
                    # Basic URL cleanup and filtering (Skip SVGs, fix relative URLs)
                    if not img_url or img_url.endswith(".svg") or ".svg" in img_url:
                        continue
                    
                    # Fix relative URLs (basic approach, uses urljoin for better robustness)
                    if img_url.startswith("//"):
                        img_url = "https:" + img_url
                    elif img_url.startswith("/"):
                        img_url = urljoin(web_url, img_url)
                    elif not img_url.startswith("http"):
                        continue
                        
                    try:
                        img_r = requests.get(img_url, timeout=10, headers=headers)
                        img_r.raise_for_status()
                        raw_image = Image.open(BytesIO(img_r.content))

                        if raw_image.size[0] * raw_image.size[1] < 500: # Skip small icons
                            continue
                        
                        caption = generate_caption_for_image(raw_image, caption_prompt)
                        results.append(f"- **{img_url}:** {caption}")
                        processed_count += 1
                        if processed_count >= 10: # Cap scraped images to 10 for performance
                            results.append("\n*--- Stopping after 10 images for performance. ---*")
                            break
                            
                    except Exception as img_e:
                        # Error downloading/processing a single scraped image
                        pass # Silently skip troublesome images

                if processed_count == 0:
                    results.append("No suitable images could be downloaded or processed from the URL.")

        except requests.exceptions.RequestException as e:
            results.append(f"Error accessing URL: {e}")
        except Exception as e:
            results.append(f"An unexpected error occurred during scraping: {e}")

    # --- Final Output Formatting ---
    if not results:
        return "Please select an input method and provide the necessary files/URL."
        
    return "\n\n".join(results)

# --- 4. Gradio Interface Definition ---

# Define the components with the flexibility to handle all inputs
with gr.Blocks(title="Unified BLIP Captioner") as iface:
    gr.Markdown("# 📷 Unified Image Captioning Tool")
    gr.Markdown("Select an input method to generate captions using the BLIP model.")
    
    # Function to toggle visibility based on radio choice (FIXED)
    def update_visibility(choice):
        # The condition now correctly checks against the radio button value
        if choice == "Local File Upload":
            # Show local file upload, hide URL input
            return gr.update(visible=True), gr.update(visible=False) 
        else: # "Image URL (Scraping)"
            # Hide local file upload, show URL input
            return gr.update(visible=False), gr.update(visible=True)
            
    with gr.Row():
        input_method = gr.Radio(
            ["Local File Upload", "Image URL (Scraping)"], 
            label="1. Choose Input Method", 
            value="Local File Upload"
        )
        caption_prompt = gr.Textbox(
            label="Optional: Caption Prompt Prefix (e.g., 'A professional photo of')", 
            placeholder="Leave blank for standard unconditional captioning."
        )

    with gr.Row():
        local_image_files = gr.Files(
            label="2A. Upload Local Image(s) (Batch/Single)", 
            file_count="multiple",
            file_types=["image"],
            visible=True # Initial state is visible (matches default radio choice)
        )
        web_url = gr.Textbox(
            label="2B. Enter Web URL to Scrape Images", 
            placeholder="e.g., https://en.wikipedia.org/wiki/IBM",
            visible=False # Initial state is hidden
        )
        
    output_text = gr.Markdown(label="Caption Results")
    
    submit_btn = gr.Button("Generate Captions", variant="primary")

    # Add change listener to dynamically show/hide input fields
    input_method.change(
        fn=update_visibility,
        inputs=[input_method],
        outputs=[local_image_files, web_url]
    )

    # Define the action for the button click (UPDATED INPUTS)
    submit_btn.click(
        fn=unified_captioner,
        inputs=[input_method, local_image_files, web_url, caption_prompt],
        outputs=output_text
    )

iface.launch()
