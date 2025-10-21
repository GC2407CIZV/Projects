# 🎓 Capstone Project: AI-Based Emotion Detection Web Application

## Project Overview

This project serves as the **Final Capstone for the Developing AI Applications with Python and Flask course**. It implements a full-stack AI-based web application designed to demonstrate the entire development and deployment pipeline. The core service is an **Emotion Detection System** built on the **Flask framework** that integrates **Watson Natural Language Processing (NLP)** to analyze customer feedback text.

The system identifies the dominant emotion (joy, sadness, anger, fear, or disgust), providing valuable emotional insights required for modern AI applications.

---

## 🚀 Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You will need the following installed:

* **Python 3.x**
* **pip** (Python package installer)
* **git**

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/GC2407CIZV/Projects/tree/main/AI-Based%20Emotion%20Detection%20Web%20Application]
    cd final_project
    ```

2.  **Create and activate a virtual environment** (recommended):
    ```bash
    python -m venv venv
    # On Windows:
    .\venv\Scripts\activate
    # On macOS/Linux:
    source venv/bin/activate
    ```

3.  **Install the necessary dependencies:**
    *(Note: You will need to create a `requirements.txt` file containing `flask`, `ibm-watson-machine-learning`, etc.)*
    ```bash
    pip install -r requirements.txt
    ```

---

## 📂 Project Structure
```
final_project/
├── EmotionDetection/ # Python package containing the core AI logic (Task 4)
│     ├── init.py # Package initialization
│     └── emotion_detection.py # The emotion_detector function (Task 2 & 3)
├── Screenshots/ # Directory to store all required PNG images for the peer review.
├── static/ # Assets served directly to the client (CSS, JS)
│     └── mywebscript.js # JavaScript for front-end interactivity
├── templates/ # HTML templates rendered by Flask
│     └── index.html # The main user interface
├── PROJECT_GUIDE.md # Detailed, step-by-step instructions for completing the project.
├── server.py # Main Flask application, defines routes and handles requests (Task 6 & 7)
├── test_emotion_detection.py # Unit tests for the core detection function (Task 5)
├── .gitignore # Files/folders to be ignored by Git
└── README.md # This documentation file (main entry point)
```
---

## ⚙️ Usage and Deployment

### 1. Running Unit Tests (Task 5)

Before deploying, ensure the core logic is sound:

```bash
python -m unittest tests/test_emotion_detector.py
```
---

## ✅ Project Tasks and Objectives

This project successfully addresses the full development pipeline, covering all objectives outlined in the course guidelines:

| Task | Objective | Status |
| :--- | :--- | :--- |
| **Task 1-4** | **Application Packaging** | Setup, creation, output formatting, and modular packaging of the `EmotionDetection` module. |
| **Task 5** | **Unit Testing** | Implementation and execution of tests (`test_emotion_detection.py`) for validation. |
| **Task 6** | **Web Deployment** | Creation of the web interface and API using Flask (`server.py`). |
| **Task 7** | **Error Handling** | Implementation of logic in `server.py` to handle invalid or empty text input gracefully. |
| **Task 8** | **Static Code Analysis** | Ensuring code quality and adherence to required style standards. |

---
