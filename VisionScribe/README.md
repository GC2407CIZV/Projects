# 🖼️ VisionScribe: BLIP Image Captioning Tools

This repository contains a collection of Python scripts leveraging the **BLIP (Bootstrapping Language-Image Pre-training)** and **BLIP-2** models from Hugging Face for automated image captioning. The project offers solutions for single-image processing, command-line batch processing, and a comprehensive, unified web application.

## ✨ Project Features

This repository includes four main scripts designed for different use cases:

1. **`image_captioning_app.py`** (Gradio App - BLIP): An interactive web app for generating a caption for a **single uploaded image**.

2. **`image_directory_captioner.py`** (CLI Tool - BLIP-2): A command-line script for **batch processing** all image files in a specified local directory.

3. **`automate_url_captioner.py`** (CLI Tool - BLIP): A command-line script for **scraping and captioning** all images found on a single, predefined web URL.

4. **`uni_image_cap_tool.py`** (Gradio App - BLIP): A unified web application that allows users to generate captions either by **uploading multiple images** (batch mode) or by **scraping images from an entered web URL**.

## 💻 Prerequisites

Before running any scripts, ensure you have **Python (3.8+)** is installed on your system.

## ⚙️ Setup and Installation

Follow these steps to get the project running locally.

### 1. Clone the Repository
```
git clone https://github.com/GC2407CIZV/Projects/VisionScribe.git
cd VisionScribe
```

### 2. Install Dependencies

All necessary machine learning, web app, and scraping libraries can be installed using this single command:

```
# Install core libraries (PyTorch, Hugging Face, Gradio, etc.)
pip install torch numpy transformers accelerate gradio pillow requests beautifulsoup4
```

**Note:** The **BLIP-2** model used in `image_directory_captioner.py` is significantly larger than the BLIP base model and requires substantial VRAM/RAM.

## 🚀 Usage

### 1. Simple Single-Image App (`image_captioning_app.py`)

Run the most basic interactive app:

```
python image_captioning_app.py
```
### 2. Command-Line Batch Captioner (`image_directory_captioner.py`)

1. **Edit the script:** Change the `image_dir` variable to point to your local image folder:
```
image_dir = "/path/to/your/images"
```
2. **Run the script:**
```
python image_directory_captioner.py
```
3. **View Results:** Captions are saved to **`captions.txt`**.

### 3. Command-Line URL Scraper (`automate_url_captioner.py`)

This script is pre-configured to scrape the Wikipedia page for IBM.

1. **Edit the script (Optional):** Change the `url` variable if you wish to scrape a different page.

2. **Run the script:**
```
python automate_url_captioner.py
```
3. **View Results:** Captions are saved to **`captions.txt`**.

### 4. Unified Web Tool (`uni_image_cap_tool.py`)

This tool provides a combined, interactive interface for batch upload and URL scraping.

1. **Run the script:**
```
python uni_image_cap_tool.py
```
## 🧠 Models Used

| Script Name | Model Used | Primary Use Case | 
| ----- | ----- | ----- | 
| `image_captioning_app.py` | `BLIP-Base` | Interactive Single Image | 
| `image_directory_captioner.py` | `BLIP-2 opt-2.7b` | High-Quality Batch CLI Processing | 
| `automate_url_captioner.py` | `BLIP-Base` | Automated URL Scraping CLI | 
| `uni_image_cap_tool.py` | `BLIP-Base` | Unified Interactive Web Tool | 

## 📜 License

This project is licensed under the MIT License.
