# 💼 AI Career Coach Pro: Your Personalized Job Application Toolkit

## Project Overview

This project is a powerful, integrated application designed to assist job seekers by leveraging the advanced capabilities of a Large Language Model (LLM) to optimize their application materials. Built using the **IBM watsonx.ai** platform and **Gradio**, the tool provides four core, personalized services running from a single interface: resume enhancement, customized cover letter generation, strategic career advice, and mock interviews.

This application moves beyond simple Q&A to provide complex, structured analysis and generation, making the job application process more efficient and competitive.

---

## ✨ Features

The AI Career Coach application runs from a single script and uses a **tabbed interface** for four specialized modules:

| Tab Name | Core Function | LLM Goal |
| :--- | :--- | :--- |
| **Resume Polisher** 📝 | Optimizes resume content against a target job. | Analysis and targeted suggestion generation. |
| **Cover Letter Generator** ✉️ | Drafts a personalized cover letter. | Intelligent synthesis of multiple inputs into a formal document. |
| **Career Advisor** 💡 | Analyzes skill gaps and offers strategic, forward-looking advice. | Gap analysis and strategic advice generation. |
| **Interview Prep** 🎤 | Conducts a realistic mock interview and provides coaching feedback. | Conversational simulation and analytical feedback generation. |

---

## 🖼️ Demo & Output Highlight

**(Note: Add a screenshot or a GIF of the Gradio interface here.)**

**Key Output Samples:**

* **Cover Letter:** Automatically synthesizes data from the provided resume, JD, and company name to generate a highly customized and persuasive letter in seconds.
* **Resume Feedback:** Provides a score and specific, actionable bullet-point suggestions for improving the resume against the target Job Description (JD).
* **Interview Coaching:** Delivers a score, coaching tips, and rephrasing advice based on the user's conversational responses.

---

## 🛠️ Technology Stack

* **Main Application File:** `career_coach_app.py`
* **Language Model (LLM):** `ibm/granite-3-8b-instruct` (via IBM watsonx.ai)
* **Frontend Framework:** Gradio (for a simple, web-based UI)
* **Backend Framework:** Python
* **Key Libraries:** `pypdf`, `python-docx`, `pandas`, `numpy`, `ibm_watsonx_ai` (for LLM integration)

---

## ⚙️ Setup and Installation

### A. Prerequisites (Linux/Ubuntu)

If you are using a Debian or Ubuntu-based system (like a Linux VM or cloud instance), you may need to install the `python3-venv` package, which is required to create isolated Python environments.

```bash
# Update package lists
sudo apt update

# Install the Python Virtual Environment package
sudo apt install python3-venv
```
### B. Virtual Environment
It is highly recommended to use a virtual environment to manage dependencies and avoid conflicts with system packages.
```bash
# Create the environment
python3 -m venv my_env

# Activate the environment (Linux/macOS)
source my_env/bin/activate

# Activate the environment (Windows)
.\my_env\Scripts\activate
```
### C. Install Required Libraries
Install all necessary packages using the requirements.txt file:
```bash
pip install -r requirements.txt
```
## Running the Application
The entire application runs from the single script, `career_coach_app.py`.:
```bash
python3 career_coach_app.py
```
After execution, Gradio will provide a local URL (e.g., `http://127.0.0.1:7860`) which you can open in your web browser.

## 🔑 LLM Access Notes
This project leverages the IBM watsonx.ai platform.

- The code is configured to use a placeholder project_id="skills-network" which grants access within the specified learning environment.

- To run this code outside of the dedicated learning environment, you would need to replace the placeholder credentials with your own API Key and Project ID from a registered IBM Cloud account.
---

## 💡 Prompt Engineering Highlight
A core success factor of this project is the use of specialized **Prompt Engineering**. Each module uses a carefully crafted prompt to instruct the LLM:

- **Resume Polisher Prompt Focus:** Analysis and targeted suggestion generation.

- **Cover Letter Prompt Focus:** Intelligent synthesis of multiple inputs (Company, Job Description, Resume) into a formal, persuasive document.

- **Career Advisor Prompt Focus:** Gap analysis and strategic advice generation.

- **Interview Prep Prompt Focus:** Conversational simulation, scoring based on criteria, and structured coaching advice.
