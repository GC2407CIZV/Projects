# 🖼️ VisionScribe — Multimodal AI Image Captioning Toolkit

**Generative AI · Computer Vision · Vision-Language Models · BLIP · BLIP-2 · Hugging Face Transformers · Gradio · Web Scraping**

> **Project Context:** IBM Generative AI Engineering Professional Certificate  
> **Focus:** Multimodal Generative AI · Automated Image Captioning · AI Application Development

A multimodal AI project that uses pretrained **BLIP and BLIP-2 vision-language models** to automatically generate natural-language descriptions of images.

The project evolved from a simple single-image captioning application into a broader toolkit supporting **interactive caption generation, local batch processing, automated webpage image extraction, and a unified Gradio interface**.

---

## ⭐ Key Highlights

- Implemented automated image captioning with **BLIP** and **BLIP-2**.
- Integrated pretrained vision-language models through **Hugging Face Transformers**.
- Built an interactive **Gradio** application for single-image captioning.
- Extended the system to process entire directories of images automatically.
- Implemented webpage scraping to discover, download, and caption images from web pages.
- Built a unified application supporting:
  - multiple local image uploads;
  - webpage image extraction;
  - batch caption generation;
  - optional prompt-conditioned captioning.
- Added image filtering and error handling for unreliable web content.
- Used URL resolution to handle relative image paths.
- Explored the practical computational trade-offs between **BLIP Base** and the substantially larger **BLIP-2 OPT-2.7B** model.
- Consolidated multiple experimental scripts into a more reusable multimodal AI application.

---

## 🎯 Project Objective

Image captioning combines **computer vision** and **natural-language generation**.

The goal is to transform visual information into useful textual descriptions:

```text
Image
  ↓
Vision-Language Model
  ↓
Visual Representation
  ↓
Language Generation
  ↓
Natural-Language Caption
```

Rather than limiting the project to captioning one image at a time, I explored how the same underlying AI capability could be incorporated into different workflows.

The project therefore addressed four progressively broader use cases:

1. caption a single uploaded image;
2. caption multiple images stored locally;
3. automatically extract and caption images from a webpage;
4. combine local and web-based workflows into one interactive application.

---

## 🧠 Models

Two pretrained vision-language architectures were explored.

### BLIP

**BLIP — Bootstrapping Language-Image Pre-training**

The majority of the project uses:

```text
Salesforce/blip-image-captioning-base
```

with:

```python
AutoProcessor
BlipForConditionalGeneration
```

BLIP provides a practical balance between caption quality and computational requirements and is used for the interactive and web-based applications.

### BLIP-2

The local directory-processing experiment uses:

```text
Salesforce/blip2-opt-2.7b
```

with:

```python
Blip2Processor
Blip2ForConditionalGeneration
```

BLIP-2 is substantially larger and more computationally demanding than BLIP Base.

Using both models provided practical experience with the trade-off between:

> **model capability ↔ computational requirements ↔ application usability**

---

## 🏗️ Project Evolution

The repository reflects an iterative development process rather than a single isolated script.

### Stage 1 — Single-Image Captioning

The initial application focused on the core inference workflow:

```text
Uploaded Image
      ↓
NumPy Array
      ↓
PIL RGB Image
      ↓
BLIP Processor
      ↓
BLIP Model
      ↓
Generated Caption
      ↓
Gradio Interface
```

This established the fundamental image-to-text pipeline.

### Stage 2 — Batch Directory Processing

The next implementation extended captioning from individual images to an entire local directory.

The application:

1. searches for supported image formats;
2. opens each image;
3. converts it to RGB;
4. sends it through BLIP-2;
5. generates a caption;
6. writes the filename and caption to `captions.txt`.

Supported formats include:

```text
.jpg
.jpeg
.png
```

This transformed the model from an interactive demonstration into an **automated batch-processing workflow**.

### Stage 3 — Automated Web Image Captioning

The project was then expanded beyond local files.

A web-captioning script:

1. requests a webpage;
2. parses its HTML with **BeautifulSoup**;
3. discovers `<img>` elements;
4. extracts image URLs;
5. resolves relative paths;
6. skips unsupported SVG resources;
7. downloads usable images;
8. filters extremely small images;
9. generates captions;
10. saves the image URL and generated caption.

The original implementation used an IBM Wikipedia page as the demonstration source, while the workflow itself can be adapted to other pages.

```text
Webpage URL
     ↓
HTTP Request
     ↓
HTML
     ↓
BeautifulSoup
     ↓
Image Discovery
     ↓
Image Download
     ↓
Filtering / Validation
     ↓
BLIP
     ↓
Generated Captions
```

### Stage 4 — Unified VisionScribe Application

The most developed implementation combines the earlier workflows into a single **Gradio application**.

Users can choose between:

```text
                VisionScribe
                     │
          ┌──────────┴──────────┐
          │                     │
   Local File Upload       Web URL
          │                     │
 Single / Multiple       Scrape Images
       Images                  │
          │              Download / Filter
          └──────────┬──────────┘
                     │
                   BLIP
                     │
             Caption Generation
                     │
              Formatted Results
```

This version provides a more complete application rather than a model demonstration alone.

---

## 🖥️ Unified Application Features

### Local Image Upload

Users can upload one or multiple image files.

Each image is:

- opened with Pillow;
- converted to RGB;
- processed independently;
- captioned using BLIP;
- returned with its filename.

This allows both **single-image and batch inference** through the same interface.

### Webpage Image Captioning

Users can provide a webpage URL.

The application:

- sends an HTTP request;
- parses the page;
- discovers image elements;
- retrieves image URLs;
- resolves relative URLs;
- skips SVG resources;
- downloads images;
- filters very small images;
- generates captions;
- returns the source URL with each caption.

The unified implementation limits processing to **10 suitable images per webpage** to prevent uncontrolled processing time.

### Optional Prompt Conditioning

The unified application also supports an optional text prefix.

For example:

```text
A professional photo of
```

When a prompt is supplied, the processor receives both the image and text prompt. Otherwise, standard image captioning is performed without a text prompt.

This demonstrates the ability to move beyond completely unconditional caption generation toward **prompt-conditioned multimodal generation**.

---

## 🌐 Web Processing

Processing images from arbitrary webpages introduced challenges that do not exist when working with controlled local images.

### Relative URLs

Web pages may contain image paths such as:

```text
/images/example.jpg
```

rather than complete URLs.

The unified application uses:

```python
urljoin()
```

to resolve relative paths against the original webpage URL.

### Unsupported Images

SVG resources are skipped because they cannot necessarily be processed directly through the Pillow-based raster-image pipeline.

### Small Images

Websites frequently contain tiny icons, tracking images, and decorative resources.

The scripts therefore use minimum-size filtering before sending images to the captioning model.

### HTTP Failures

The unified version uses:

```python
response.raise_for_status()
```

to detect unsuccessful HTTP responses.

### Individual Image Failures

A single inaccessible or malformed image should not terminate processing of the entire webpage.

Image-level exception handling allows the workflow to continue processing subsequent resources.

---

## 🧩 Challenges & How I Addressed Them

| Challenge | How I Addressed It | What It Demonstrated |
| --- | --- | --- |
| **Connecting visual input to language generation** | Used pretrained BLIP vision-language models through Hugging Face | Multimodal AI integration |
| **Different image representations** | Converted inputs to consistent RGB PIL images | Image preprocessing |
| **Single-image workflow did not scale** | Developed directory and multi-upload processing | Batch automation |
| **Web images have inconsistent URLs** | Added absolute and relative URL handling with `urljoin()` | Web-data engineering |
| **Webpages contain unusable image resources** | Filtered SVGs and very small images | Input validation |
| **Individual downloads can fail** | Added per-image exception handling | Fault-tolerant processing |
| **Large models require more resources** | Used BLIP Base for lighter interactive workflows and explored BLIP-2 separately | Model/resource trade-offs |
| **Separate scripts created fragmented workflows** | Consolidated local and web captioning into one Gradio application | Application architecture |
| **Different user workflows require different inputs** | Added dynamic Gradio controls for local files and URLs | UI design |
| **Model loading can fail** | Added guarded initialization and user-facing error handling | Application robustness |
| **Web scraping can become expensive** | Limited the unified application to 10 processed images per page | Resource management |

---

## 🛠️ Technical Stack

| Area | Technologies |
| --- | --- |
| **Programming** | Python |
| **Generative AI** | BLIP, BLIP-2 |
| **Model Framework** | Hugging Face Transformers |
| **Deep Learning** | PyTorch |
| **Image Processing** | Pillow |
| **Numerical Processing** | NumPy |
| **Web Application** | Gradio |
| **Web Requests** | Requests |
| **HTML Parsing** | BeautifulSoup |
| **URL Processing** | `urllib.parse.urljoin` |
| **Batch Processing** | `os`, `glob` |

---

## 📂 Repository Components

### `image_captioning_app.py`

Basic interactive BLIP application.

**Purpose:** Generate a caption for a single uploaded image.

**Model:** `Salesforce/blip-image-captioning-base`  
**Interface:** Gradio

### `image_directory_captioner.py`

Local batch-processing script.

**Purpose:** Generate captions for images stored in a directory and save the results to `captions.txt`.

**Model:** `Salesforce/blip2-opt-2.7b`  
**Interface:** Command line

### `automate_url_captioner.py`

Automated webpage image-captioning script.

**Purpose:** Extract images from a webpage, caption suitable images, and save the URL-caption pairs.

**Model:** `Salesforce/blip-image-captioning-base`  
**Technologies:** Requests + BeautifulSoup + BLIP

### `uni_image_cap_tool.py`

Unified application combining the previous concepts.

**Purpose:** Provide one interface for:

- single-image processing;
- multi-image batch processing;
- webpage scraping;
- optional caption prompting.

**Model:** `Salesforce/blip-image-captioning-base`  
**Interface:** Gradio Blocks

---

## ⚙️ Installation

### Clone the Repository

If VisionScribe is stored inside the larger Projects portfolio repository:

```bash
git clone https://github.com/GC2407CIZV/Projects.git
cd Projects
```

Then navigate to the VisionScribe project directory.

> Update the directory command to match the exact folder name used in the repository.

### Install Dependencies

```bash
pip install torch numpy transformers accelerate gradio pillow requests beautifulsoup4
```

### Model Download

The pretrained Hugging Face model files are downloaded when the scripts first initialize the corresponding model.

BLIP-2 OPT-2.7B is considerably larger than BLIP Base and may require substantially more memory and processing resources.

---

## 🚀 Usage

### Single-Image Application

```bash
python image_captioning_app.py
```

Upload an image through the Gradio interface and the model will generate a caption.

### Directory Batch Captioner

First configure:

```python
image_dir = "/path/to/your/images"
```

Then run:

```bash
python image_directory_captioner.py
```

Generated captions are written to:

```text
captions.txt
```

### Webpage Captioner

Configure the desired URL in:

```python
url = "https://en.wikipedia.org/wiki/IBM"
```

Then run:

```bash
python automate_url_captioner.py
```

Image URLs and generated captions are saved to `captions.txt`.

### Unified Application

```bash
python uni_image_cap_tool.py
```

The interface allows the user to choose between:

- **Local File Upload**
- **Image URL (Scraping)**

and optionally provide a caption prompt.

---

## ⚠️ Limitations & Critical Evaluation

### Caption Accuracy

BLIP-generated captions are predictions rather than guaranteed descriptions.

The model may:

- omit important visual details;
- misidentify objects;
- generate overly generic descriptions;
- produce incorrect captions.

Generated descriptions should therefore not automatically be treated as factual ground truth.

### Web Scraping Reliability

Modern websites may:

- load images dynamically through JavaScript;
- use lazy-loading mechanisms;
- block automated requests;
- require authentication;
- store images in unsupported formats.

BeautifulSoup-based HTML parsing therefore cannot retrieve every image visible in a browser.

### Resource Requirements

BLIP-2 OPT-2.7B is significantly more computationally expensive than BLIP Base.

This limits its practicality on machines with restricted memory or compute resources.

### Batch Performance

The current implementation processes images sequentially.

Large-scale captioning would require a more efficient inference architecture.

### Web Content

Images obtained from external webpages remain subject to the respective site's terms, access restrictions, and intellectual-property rights.

### Model Bias

Pretrained vision-language models inherit limitations and biases from their training data.

Their captions should be evaluated carefully when used in real-world applications.

---

## 🔄 Future Improvements

If I extended VisionScribe today, I would:

- add **GPU / CPU device detection**;
- use inference mode and optimized tensor placement;
- implement true batched model inference;
- add configurable generation parameters;
- support additional image formats;
- improve lazy-loaded image discovery;
- validate MIME types before image processing;
- add retry and timeout strategies for web requests;
- improve duplicate-image detection;
- expose alternative captions where appropriate;
- compare newer vision-language models;
- add structured JSON / CSV export;
- create automated tests for preprocessing and URL handling;
- containerize and deploy the application;
- investigate accessibility use cases such as draft alt-text generation.

For accessibility applications, generated captions should remain **human-reviewed** rather than being treated as automatically reliable alt text.

---

## 🧠 What I Learned

This project helped me understand that using a generative AI model is only one part of building an actual AI application.

### Multimodal Models Connect Different Data Modalities

BLIP takes visual information and generates language from it:

```text
Computer Vision + Language Modeling
                  ↓
          Multimodal AI
```

### A Model Demo Is Different from an Application

The initial single-image implementation demonstrated that BLIP worked.

The later versions required solving additional engineering problems:

- multiple inputs;
- file handling;
- web requests;
- HTML parsing;
- URL normalization;
- input filtering;
- exception handling;
- interface design;
- resource constraints.

These surrounding systems are essential for turning a model into a usable application.

### Model Size Creates Engineering Trade-Offs

BLIP-2 provides a more computationally demanding architecture than BLIP Base.

Experimenting with both reinforced that model selection is not simply about choosing the largest available model.

Practical AI systems must balance:

> **capability · latency · memory · usability · infrastructure cost**

### External Data Is Unpredictable

Local images are controlled inputs. Web images are not.

Building the scraping workflow demonstrated the importance of robust preprocessing and defensive programming when AI systems consume real-world external data.

### Iterative Development Improves Architecture

The progression from several specialized scripts to a unified interface showed how experimental prototypes can gradually be refactored into a more coherent application.

---

## 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What is VisionScribe?** | A multimodal AI toolkit that generates natural-language captions from images |
| **Project context?** | IBM Generative AI Engineering Professional Certificate |
| **Main AI task?** | Image captioning |
| **Models used?** | BLIP Base and BLIP-2 OPT-2.7B |
| **Framework?** | Hugging Face Transformers with PyTorch |
| **Interface?** | Gradio |
| **What can the project do?** | Caption single images, batches of local images, and images extracted from webpages |
| **Why use BLIP?** | It provides pretrained vision-language capabilities suitable for image-to-text generation |
| **Why experiment with BLIP-2?** | To explore a larger multimodal architecture and its computational trade-offs |
| **Biggest engineering challenge?** | Extending controlled image inference to unreliable external webpage content |
| **How did you handle relative image URLs?** | Used URL resolution with `urljoin()` in the unified application |
| **How did you handle bad web images?** | Filtering plus image-level exception handling |
| **How did the project evolve?** | Single-image app → batch processing → web scraping → unified application |
| **What did the unified tool add?** | Multiple uploads, webpage scraping, optional prompting, dynamic UI controls, and centralized caption generation |
| **Main limitation?** | Generated captions can be incomplete or incorrect and should not be treated as factual ground truth |
| **What would you improve today?** | Batched GPU inference, stronger web handling, testing, structured exports, deployment, and newer VLM comparison |
| **What does the project demonstrate?** | Multimodal GenAI integration plus the engineering required to turn a pretrained model into a usable application |

---

## 🎓 Project Context

This project was developed as part of the:

**IBM Generative AI Engineering Professional Certificate**

It demonstrates practical experience with:

**Generative AI · Multimodal AI · Computer Vision · Vision-Language Models · BLIP · BLIP-2 · Hugging Face Transformers · PyTorch · Gradio · Image Processing · Web Scraping · Batch Processing · AI Application Development**

---

## 📄 Educational & Portfolio Use

This repository is presented for **educational and portfolio purposes**.

The implementation demonstrates my work with vision-language models, image captioning, web-image processing, batch automation, and interactive AI application development.

Pretrained models, libraries, course materials, external webpages, and other third-party resources remain subject to their respective licenses, terms, and ownership.

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Data Visualization · Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
