# 🤖 RAG-Powered Q&A Bot with LangChain and watsonx.ai

This project implements a complete **Retrieval-Augmented Generation (RAG)** pipeline using **LangChain** and **IBM watsonx.ai** to enable question-answering over custom, uploaded PDF documents.

The application allows users to upload a PDF file and ask specific questions, with the LLM leveraging the content of the document for accurate, context-aware answers.

***

## ⚙️ Key Technologies

* **Orchestration:** [LangChain](https://www.langchain.com/) (The framework connecting all components)
* **LLM (Generator):** **Mistral Medium** on IBM watsonx.ai
* **Embedding Model:** **Slate-30m-English-RTRVR-v2** on IBM watsonx.ai
* **Vector Store:** [ChromaDB](https://www.trychroma.com/) (Local persistence for vector embeddings)
* **Document Loading:** `PyPDFLoader`
* **Web Interface:** [Gradio](https://www.gradio.app/) (For a simple, interactive chat UI)

***

## 🚀 How It Works (The RAG Pipeline)

The bot operates through a six-step RAG pipeline to generate answers:

1.  **Ingestion (`document_loader`):** A user uploads a PDF. The `PyPDFLoader` extracts the raw text content.
2.  **Chunking (`text_splitter`):** A `RecursiveCharacterTextSplitter` breaks the document into smaller, manageable chunks (1000 characters with 200 character overlap).
3.  **Vectorization (`watsonx_embedding`):** The chunks are converted into numerical vectors (embeddings) using the `Slate-30m` model.
4.  **Storage (`vector_database`):** These vectors are stored in the local Chroma vector database.
5.  **Retrieval (`retriever`):** When a user asks a question, the question is also converted to a vector. The retriever searches the ChromaDB for the most relevant document chunks (the "context").
6.  **Generation (`retriever_qa`):** The Mistral LLM receives both the **user's question** and the **retrieved context** and synthesizes a final, grounded answer.

***

## 🛠️ Project Setup

### 1. Prerequisites

You must have an IBM watsonx.ai account and obtain the necessary credentials (API Key and Project ID) to run this application.

### 2. Install Dependencies

Clone this repository and install all required libraries:

```bash
pip install -r requirements.txt
# Ensure you have the core libraries:
# pip install ibm-watsonx-ai langchain langchain-ibm langchain-community pypdf chromadb gradio
```
### 3. Run the Application
Save the code as qabot.py. You will need to replace the project_id in the code with your actual IBM Project ID, or configure it via environment variables.

Run the file to launch the Gradio interface:
```Bash
python qabot.py
```
The application will launch locally (e.g., at `http://0.0.0.0:7863`), allowing you to upload a PDF and start asking questions.
