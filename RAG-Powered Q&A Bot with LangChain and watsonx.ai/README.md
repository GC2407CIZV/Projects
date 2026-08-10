# 🤖 RAG-Powered Q&A Bot with LangChain and IBM watsonx.ai

**Retrieval-Augmented Generation · LangChain · IBM watsonx.ai · Mistral
· IBM Slate Embeddings · ChromaDB · Gradio · Python**

> **Project Context:** IBM Generative AI Engineering Professional
> Certificate\
> **Project:** RAG-Powered Q&A Bot\
> **Focus:** Retrieval-Augmented Generation · Semantic Retrieval ·
> Vector Embeddings · LLM Grounding

This project implements an end-to-end **Retrieval-Augmented Generation
(RAG)** application that answers questions using the contents of an
uploaded PDF.

Built with **Python**, **LangChain**, **IBM watsonx.ai**, **Chroma**,
and **Gradio**, the application transforms a document into searchable
vector representations, retrieves semantically relevant passages for a
user's question, and supplies that retrieved context to a Large Language
Model (LLM) to generate a document-grounded response.

Rather than asking the LLM to answer solely from its pretrained
knowledge, the application gives it access to information retrieved from
the user's document at query time.

------------------------------------------------------------------------

## ⭐ Key Highlights

-   Built a complete **RAG pipeline** from PDF ingestion through answer
    generation.
-   Uses **LangChain** to orchestrate document loading, chunking,
    retrieval, and generation.
-   Uses `mistralai/mistral-medium-2505` through **IBM watsonx.ai** as
    the generator.
-   Uses `ibm/slate-30m-english-rtrvr-v2` for semantic embeddings.
-   Splits documents with `RecursiveCharacterTextSplitter`.
-   Stores document embeddings in **Chroma**.
-   Converts the vector store into a LangChain retriever.
-   Uses `RetrievalQA` with a `stuff` chain to combine retrieved context
    with the user query.
-   Provides a simple **Gradio** interface for PDF upload and question
    answering.
-   Demonstrates the distinction between **retrieval** and
    **generation** in an applied LLM system.

------------------------------------------------------------------------

# 🎯 Project Objective

The objective is to build a question-answering system that can work with
information that is not necessarily contained in an LLM's pretrained
knowledge.

The application follows the core RAG pattern:

``` text
Uploaded PDF
     ↓
Document Loading
     ↓
Text Chunking
     ↓
Embedding Generation
     ↓
Vector Storage
     ↓
Semantic Retrieval
     ↓
Retrieved Context + User Question
     ↓
Large Language Model
     ↓
Grounded Answer
```

This architecture is useful when an application needs to answer
questions over private, specialized, recent, or domain-specific
documents without retraining the underlying language model.

------------------------------------------------------------------------

# 🏗️ Architecture

``` text
                         ┌──────────────────────┐
                         │     Uploaded PDF     │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │     PyPDFLoader      │
                         │  Document Ingestion  │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │ RecursiveCharacter  │
                         │    TextSplitter      │
                         │ 1000 / 200 overlap   │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │ IBM Slate Embeddings │
                         │   watsonx.ai         │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │       Chroma         │
                         │    Vector Store      │
                         └──────────┬───────────┘
                                    │
                                    ▼
User Question ───────────────► Semantic Retriever
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │ Relevant PDF Chunks  │
                         └──────────┬───────────┘
                                    │
                    User Question + Retrieved Context
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │   Mistral Medium     │
                         │   IBM watsonx.ai     │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │   Generated Answer   │
                         └──────────────────────┘
```

------------------------------------------------------------------------

# 🔄 How the RAG Pipeline Works

The implementation is divided into seven clearly defined tasks.

## Task 0 --- Initialize the Generator

``` python
def get_llm():
```

The application initializes:

``` text
mistralai/mistral-medium-2505
```

through LangChain's:

``` python
WatsonxLLM
```

Generation parameters include:

``` python
TEMPERATURE = 0.5
MAX_NEW_TOKENS = 256
DECODING_METHOD = "sample"
```

The model serves as the **generation component** of the RAG system.

Its role is not to search the PDF directly. Instead, it receives
relevant context selected by the retrieval system and generates an
answer from that context.

------------------------------------------------------------------------

## Task 1 --- Document Ingestion

``` python
def document_loader(file):
```

The uploaded PDF is loaded using:

``` python
PyPDFLoader
```

LangChain converts the PDF into document objects containing extracted
text and associated metadata.

Conceptually:

``` text
PDF
 ↓
PyPDFLoader
 ↓
LangChain Documents
```

This is the ingestion stage of the pipeline.

------------------------------------------------------------------------

## Task 2 --- Text Chunking

``` python
def text_splitter(data):
```

The extracted document is divided using:

``` python
RecursiveCharacterTextSplitter
```

with:

``` text
Chunk size:    1000 characters
Chunk overlap: 200 characters
```

The overlap helps preserve context when information crosses a chunk
boundary.

``` text
Original Document

┌───────────────────────────────┐
│                               │
│          Full Text            │
│                               │
└───────────────────────────────┘
                ↓
┌──────────────┐
│   Chunk 1    │
└──────────────┘
         ┌──────────────┐
         │   Chunk 2    │
         └──────────────┘
                  ┌──────────────┐
                  │   Chunk 3    │
                  └──────────────┘
```

The overlapping regions reduce the chance that semantically connected
text is separated completely during retrieval.

------------------------------------------------------------------------

## Task 3 --- Embedding Generation

``` python
def watsonx_embedding():
```

The project uses:

``` text
ibm/slate-30m-english-rtrvr-v2
```

through:

``` python
WatsonxEmbeddings
```

An embedding model converts text into a numerical vector representation.

Conceptually:

``` text
"Retrieval-Augmented Generation combines retrieval and generation."

                         ↓

[0.18, -0.42, 0.07, ..., 0.31]
```

Texts with related semantic meaning should occupy nearby regions of the
embedding space.

This enables retrieval based on **semantic similarity** rather than only
exact keyword matching.

------------------------------------------------------------------------

## Task 4 --- Vector Storage

``` python
def vector_database(chunks):
```

Each document chunk is embedded and stored using:

``` python
Chroma.from_documents(...)
```

The vector store connects:

``` text
Document Chunk
      ↕
Embedding Vector
```

This gives the application a searchable semantic representation of the
uploaded document.

In the supplied implementation, Chroma is created for the current
workflow without an explicit persistence directory; it should therefore
be described as the application's vector store rather than as a
deliberately configured persistent knowledge base.

------------------------------------------------------------------------

## Task 5 --- Retrieval

``` python
def retriever(file):
```

The function combines the earlier stages:

``` text
Load PDF
   ↓
Split Text
   ↓
Create Embeddings
   ↓
Build Chroma Vector Store
   ↓
Create Retriever
```

The vector store is converted into a LangChain retriever using:

``` python
vectordb.as_retriever()
```

When a question is submitted, the retriever identifies chunks whose
embeddings are most relevant to the query.

------------------------------------------------------------------------

## Task 6 --- Answer Generation

``` python
def retriever_qa(file, query):
```

The final stage uses:

``` python
RetrievalQA.from_chain_type(...)
```

with:

``` text
chain_type = "stuff"
```

The workflow becomes:

``` text
Question
   ↓
Retriever
   ↓
Relevant Chunks
   ↓
"Stuff" Retrieved Context into LLM Prompt
   +
Original Question
   ↓
Mistral Medium
   ↓
Answer
```

The `stuff` strategy places the retrieved documents into the model
context for answer generation.

This is simple and effective for relatively small retrieved contexts,
although larger-scale applications may require more sophisticated
document-combination strategies.

------------------------------------------------------------------------

# 🧠 Why RAG?

A conventional LLM interaction looks like:

``` text
Question
   ↓
LLM
   ↓
Answer
```

The model must rely primarily on information represented in its
pretrained parameters and whatever context the user directly supplies.

RAG adds an external retrieval layer:

``` text
Question
   ↓
Search Relevant External Information
   ↓
Retrieved Evidence
   +
Question
   ↓
LLM
   ↓
Context-Aware Answer
```

This provides several practical advantages:

-   access to user-provided information;
-   no model fine-tuning required for each document;
-   easier knowledge updates;
-   better support for specialized documents;
-   reduced dependence on model memory;
-   a stronger basis for grounded question answering.

RAG can reduce unsupported generation, but retrieval alone does **not**
guarantee factual answers. Retrieval quality, prompt design, model
behavior, and source coverage still matter.

------------------------------------------------------------------------

# 🧩 Component Responsibilities

  ----------------------------------------------------------------------------------
  Component               Technology                         Responsibility
  ----------------------- ---------------------------------- -----------------------
  **Document Loader**     `PyPDFLoader`                      Extract text from
                                                             uploaded PDFs

  **Text Splitter**       `RecursiveCharacterTextSplitter`   Divide documents into
                                                             retrievable chunks

  **Embedding Model**     IBM Slate 30M English Retriever v2 Convert text into
                                                             semantic vectors

  **Vector Store**        Chroma                             Store and search
                                                             document vectors

  **Retriever**           LangChain retriever                Select relevant chunks
                                                             for a query

  **Generator**           Mistral Medium on watsonx.ai       Generate the final
                                                             answer

  **QA Orchestration**    `RetrievalQA`                      Connect retrieval and
                                                             generation

  **Interface**           Gradio                             Accept PDFs/questions
                                                             and display answers
  ----------------------------------------------------------------------------------

A central architectural lesson is that the **embedding model and the
generator perform different jobs**.

``` text
Embedding Model → "Which document passages are relevant?"
LLM             → "How should I answer using those passages?"
```

------------------------------------------------------------------------

# 🔎 Semantic Search

Traditional keyword matching may fail when a question and a relevant
passage use different vocabulary.

For example:

``` text
Query:
"How can retrieved documents improve an LLM answer?"

Document:
"External context can be supplied to a language model at inference time."
```

The sentences share relatively few exact words but express related
concepts.

Embedding-based retrieval is designed to capture this type of semantic
relationship.

``` text
Query → Query Embedding
                    \
                     → Similarity Search → Relevant Chunks
                    /
Chunks → Embeddings
```

This is one of the key reasons vector databases are commonly used in RAG
systems.

------------------------------------------------------------------------

# 🔗 LangChain Orchestration

LangChain connects the individual RAG components into a reusable
pipeline.

Without orchestration, the application would need to manually
coordinate:

``` text
PDF parsing
→ chunk creation
→ embedding API calls
→ vector insertion
→ query embedding
→ similarity search
→ prompt construction
→ model inference
→ response extraction
```

LangChain provides abstractions for each of these stages and allows them
to be composed into a retrieval chain.

The project therefore demonstrates not only LLM usage, but also **LLM
application orchestration**.

------------------------------------------------------------------------

# 🖥️ Gradio Interface

The application exposes two primary inputs:

``` text
Upload PDF File
Input Query
```

and one output:

``` text
Generated Answer
```

The interface is implemented with:

``` python
gr.Interface
```

and launches on:

``` text
0.0.0.0:7863
```

The result is a simple browser-based demonstration of the complete RAG
pipeline.

------------------------------------------------------------------------

# 🛠️ Technical Stack

  Area                         Technology
  ---------------------------- --------------------------------------------------
  **Programming Language**     Python
  **Generative AI Platform**   IBM watsonx.ai
  **Generator**                Mistral Medium (`mistralai/mistral-medium-2505`)
  **Embedding Model**          IBM Slate 30M English Retriever v2
  **LLM Framework**            LangChain
  **watsonx.ai Integration**   `langchain-ibm`, `ibm-watsonx-ai`
  **Vector Store**             Chroma
  **Document Loader**          PyPDFLoader
  **Text Splitting**           RecursiveCharacterTextSplitter
  **Retrieval Chain**          LangChain RetrievalQA
  **Frontend**                 Gradio
  **PDF Processing**           PyPDF
  **Validation / Models**      Pydantic
  **Version Control**          Git / GitHub

------------------------------------------------------------------------

# 📂 Repository Structure

A representative structure is:

``` text
RAG-Powered-QA-Bot/
│
├── qabot.py
├── requirements.txt
├── README.md
│
└── [optional screenshots / supporting files]
```

------------------------------------------------------------------------

# ⚙️ Setup and Installation

## 1. Clone the Portfolio Repository

``` bash
git clone https://github.com/GC2407CIZV/Projects.git
cd Projects
```

Navigate to the directory containing the RAG Q&A project.

## 2. Create a Virtual Environment

``` bash
python -m venv my_env
```

### Linux / macOS

``` bash
source my_env/bin/activate
```

### Windows

``` bash
my_env\Scripts\activate
```

## 3. Install Dependencies

The original project environment used version-pinned packages:

``` bash
python -m pip install \
  gradio==4.44.0 \
  ibm-watsonx-ai==1.1.2 \
  langchain==0.2.11 \
  langchain-community==0.2.10 \
  langchain-ibm==0.1.11 \
  chromadb==0.4.24 \
  pypdf==4.3.1 \
  pydantic==2.9.1
```

Keeping the original versions documented is useful because LangChain
integrations and APIs evolve over time.

## 4. Run the Application

``` bash
python qabot.py
```

The Gradio application is configured to launch on port:

``` text
7863
```

------------------------------------------------------------------------

# 🔑 IBM watsonx.ai Access

The supplied course implementation uses:

``` python
project_id = "skills-network"
```

and:

``` text
https://us-south.ml.cloud.ibm.com
```

This configuration is associated with the IBM Skills Network environment
used for the project.

Running the application independently requires appropriate IBM
watsonx.ai access and configuration.

For a production implementation, credentials and environment-specific
configuration should be externalized rather than hard-coded into the
application.

------------------------------------------------------------------------

# 🧩 Challenges & How I Addressed Them

  -----------------------------------------------------------------------
  Challenge               Approach                What It Demonstrated
  ----------------------- ----------------------- -----------------------
  **Connecting multiple   Used LangChain          LLM application
  RAG stages**            abstractions to connect orchestration
                          loading, splitting,     
                          embeddings, retrieval,  
                          and generation          

  **Working with custom   Used `PyPDFLoader` to   Document ingestion
  documents**             convert uploaded PDFs   
                          into LangChain          
                          documents               

  **Handling long         Split text into         Context-management
  documents**             1000-character chunks   fundamentals
                          with 200-character      
                          overlap                 

  **Searching by          Generated IBM Slate     Semantic retrieval
  meaning**               embeddings and stored   
                          them in Chroma          

  **Separating retrieval  Used Slate for          RAG architecture
  from generation**       vectorization and       
                          Mistral for answer      
                          synthesis               

  **Supplying retrieved   Used LangChain          Context-grounded
  evidence to the LLM**   `RetrievalQA` with a    generation
                          `stuff` chain           

  **Creating an           Wrapped the pipeline in Applied AI application
  accessible              a Gradio interface      development
  demonstration**                                 

  **Model compatibility** Updated the generator   Practical model
                          to a supported Mistral  integration and
                          model in the supplied   maintenance
                          implementation          
  -----------------------------------------------------------------------

------------------------------------------------------------------------

# ⚠️ Limitations & Critical Evaluation

## Vector Store Rebuilt for Each Question

In the current implementation:

``` python
retriever_qa(file, query)
```

calls:

``` text
document_loader
→ text_splitter
→ vector_database
```

for every submitted query.

This means the same PDF can be parsed and embedded repeatedly rather
than indexed once and reused.

For a production system, ingestion and querying should be separated:

``` text
Upload Once → Index Once → Ask Many Questions
```

This would reduce latency and embedding cost.

## No Explicit Source Citations

The chain is configured with:

``` python
return_source_documents=False
```

The user therefore receives the generated answer without the retrieved
passages or page references.

A stronger implementation would return source documents and display
citations or page metadata alongside the answer.

## Retrieval Configuration Uses Defaults

The retriever is created with:

``` python
vectordb.as_retriever()
```

without explicit search parameters.

A more mature implementation should experiment with:

-   `k`;
-   similarity thresholds;
-   Maximum Marginal Relevance (MMR);
-   metadata filters;
-   reranking.

## Chroma Persistence Is Not Explicitly Configured

Although Chroma is the vector store, the supplied code does not define a
persistence directory.

The current implementation should therefore not be described as a
persistent document knowledge base across application sessions.

## PDF-Only Input

The interface accepts only:

``` text
.pdf
```

Future versions could support DOCX, TXT, Markdown, HTML, webpages, and
other knowledge sources.

## PDF Extraction Limitations

`PyPDFLoader` depends on extractable PDF text.

Scanned documents or PDFs with complex layouts may require OCR or more
advanced document parsing.

## Fixed Chunking Strategy

The project uses:

``` text
1000-character chunks
200-character overlap
```

This is a reasonable demonstration configuration but not universally
optimal.

Chunk size should ideally be evaluated against:

-   document structure;
-   embedding model;
-   query type;
-   retrieval recall;
-   model context limits.

## Potentially Aggressive Embedding Truncation

The supplied embedding parameters include:

``` python
EmbedTextParamsMetaNames.TRUNCATE_INPUT_TOKENS: 3
```

This setting deserves verification in the target watsonx.ai environment
because an extremely small truncation limit could materially reduce the
semantic information available to the embedding model.

## Grounding Is Not a Guarantee

RAG improves access to relevant context but does not eliminate
hallucination.

The generator may still:

-   misinterpret retrieved passages;
-   combine information incorrectly;
-   answer beyond the evidence;
-   produce unsupported details.

Production systems should use stronger prompting, source attribution,
evaluation, and possibly abstention logic.

## Course Environment Dependency

The application uses the IBM Skills Network project configuration.

Running it outside that environment requires appropriate watsonx.ai
credentials and project configuration.

------------------------------------------------------------------------

# 🚀 Future Improvements

Potential improvements include:

-   separate document ingestion from question answering;
-   cache or persist document embeddings;
-   reuse an indexed PDF across multiple questions;
-   return source documents and page citations;
-   display retrieved passages in the interface;
-   explicitly configure retrieval depth (`k`);
-   compare similarity search with MMR;
-   add similarity-score thresholds;
-   add reranking after initial retrieval;
-   introduce metadata-aware filtering;
-   experiment with semantic or structure-aware chunking;
-   evaluate chunk-size and overlap systematically;
-   verify and tune embedding truncation parameters;
-   add conversational memory for follow-up questions;
-   support multiple PDFs in one knowledge base;
-   support DOCX, TXT, Markdown, HTML, and webpages;
-   add OCR for scanned PDFs;
-   add a system prompt requiring the model to abstain when context is
    insufficient;
-   add automated RAG evaluation for retrieval and answer quality;
-   externalize watsonx.ai configuration;
-   add error handling for invalid or empty PDFs;
-   add progress indicators for document indexing;
-   modularize ingestion, retrieval, generation, and UI layers;
-   containerize and deploy the application.

------------------------------------------------------------------------

# 🧪 RAG Evaluation Opportunities

A production RAG system should be evaluated as two related but distinct
systems.

## Retrieval Evaluation

Questions include:

``` text
Did the retriever find the passage needed to answer the question?
How highly was the relevant passage ranked?
Did chunking preserve the required information?
```

Potential metrics include:

-   Recall@k;
-   Precision@k;
-   Mean Reciprocal Rank;
-   retrieval hit rate.

## Generation Evaluation

Questions include:

``` text
Is the answer supported by the retrieved context?
Is it relevant to the question?
Did the model introduce unsupported information?
```

Potential evaluation dimensions include:

-   faithfulness;
-   answer relevance;
-   context relevance;
-   citation correctness.

This distinction is important because a poor final answer can originate
from either:

``` text
Retrieval Failure
        or
Generation Failure
```

Understanding which stage failed is essential when improving a RAG
system.

------------------------------------------------------------------------

# 🧠 What I Learned

## RAG Is a System, Not a Single Model Call

The project demonstrates that document question answering requires
several coordinated components:

``` text
Loader
→ Splitter
→ Embeddings
→ Vector Store
→ Retriever
→ Generator
```

The quality of the final answer depends on the entire pipeline.

## Embeddings and LLMs Solve Different Problems

The embedding model creates representations optimized for semantic
retrieval.

The generator converts retrieved information into a natural-language
response.

Understanding this separation is fundamental to RAG architecture.

## Chunking Directly Affects Retrieval

A retriever cannot return information that was poorly represented during
ingestion.

Chunks that are too large may contain excessive irrelevant information,
while chunks that are too small may lose necessary context.

Chunking is therefore a retrieval-design decision rather than merely
preprocessing.

## Retrieval Reduces the Knowledge Boundary

An LLM does not need to be retrained whenever a document changes.

Instead:

``` text
New Document
    ↓
Re-index
    ↓
New Information Available at Query Time
```

This makes RAG particularly useful for changing or private knowledge
bases.

## Grounding and Verification Are Different

Providing retrieved context gives the model evidence, but a reliable
system should also make that evidence inspectable.

This is why source-document return, page citations, and answer-grounding
evaluation are important next steps.

## RAG Performance Requires Stage-Level Debugging

When an answer is wrong, the first question should not automatically be:

> "Why did the LLM fail?"

Instead, the system should determine whether:

1.  the document was parsed correctly;
2.  the relevant information survived chunking;
3.  the embedding represented it effectively;
4.  retrieval found the correct chunk;
5.  the prompt supplied the context appropriately;
6.  the generator used the context faithfully.

That stage-by-stage reasoning is one of the most important engineering
lessons from the project.

------------------------------------------------------------------------

# 💬 Interview Quick Reference

  -------------------------------------------------------------------------
  Question                            Quick Answer
  ----------------------------------- -------------------------------------
  **What is this project?**           A PDF question-answering application
                                      built with a complete
                                      Retrieval-Augmented Generation
                                      pipeline

  **Project context?**                IBM Generative AI Engineering
                                      Professional Certificate

  **What is RAG?**                    A pattern that retrieves relevant
                                      external information and supplies it
                                      to an LLM during generation

  **Why use RAG?**                    It lets an LLM answer using custom or
                                      changing knowledge without retraining
                                      the model

  **What orchestrates the pipeline?** LangChain

  **What is the generator?**          `mistralai/mistral-medium-2505`
                                      through IBM watsonx.ai

  **What embedding model is used?**   `ibm/slate-30m-english-rtrvr-v2`

  **What is Chroma used for?**        Storing embeddings and performing
                                      semantic vector retrieval

  **What loads the PDF?**             `PyPDFLoader`

  **How is the document split?**      `RecursiveCharacterTextSplitter` with
                                      1000-character chunks and
                                      200-character overlap

  **Why overlap chunks?**             To preserve some context when
                                      information crosses chunk boundaries

  **What does an embedding            The semantic characteristics of text
  represent?**                        as a numerical vector

  **What does the retriever do?**     Finds document chunks semantically
                                      relevant to the user's question

  **What does the LLM do?**           Generates the answer from the
                                      question and retrieved context

  **Why use separate embedding and    Retrieval and natural-language
  generation models?**                generation are different tasks
                                      optimized by different models

  **What chain is used?**             LangChain `RetrievalQA`

  **What does `chain_type="stuff"`    Retrieved documents are inserted
  mean?**                             together into the LLM context for
                                      generation

  **Does the app return citations?**  No. `return_source_documents=False`
                                      in the supplied implementation

  **Is Chroma persistent here?**      Persistence is not explicitly
                                      configured in the supplied code

  **Main efficiency limitation?**     The document is loaded, chunked, and
                                      embedded again for each query

  **How would you improve that?**     Index the document once and reuse its
                                      retriever for multiple questions

  **Can RAG still hallucinate?**      Yes. Retrieval improves grounding but
                                      does not guarantee factual generation

  **What would you improve first?**   Reusable indexing, source citations,
                                      explicit retrieval tuning, stronger
                                      grounding prompts, and RAG evaluation

  **What does the project             RAG architecture, semantic retrieval,
  demonstrate?**                      embeddings, vector databases,
                                      LangChain orchestration, watsonx.ai
                                      integration, and Gradio development
  -------------------------------------------------------------------------

------------------------------------------------------------------------

# 🎓 Project Context

This project was developed as part of the:

**IBM Generative AI Engineering Professional Certificate**

and demonstrates practical implementation of a complete
Retrieval-Augmented Generation workflow using IBM watsonx.ai and
LangChain.

The project covers:

**Retrieval-Augmented Generation · Large Language Models · IBM
watsonx.ai · LangChain · Vector Embeddings · Semantic Search · ChromaDB
· Mistral · IBM Slate · Python · Gradio**

------------------------------------------------------------------------

# 📄 Educational & Portfolio Use

This repository is presented for **educational and portfolio purposes**.

It documents an applied RAG implementation developed in the IBM
Generative AI Engineering learning environment and is intended to
demonstrate the architecture, engineering concepts, limitations, and
potential extensions of document-grounded LLM applications.

IBM watsonx.ai, IBM Slate, Mistral, LangChain, Chroma, Gradio, and other
third-party technologies remain subject to their respective licenses,
terms, and ownership.

------------------------------------------------------------------------

# 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Retrieval-Augmented
Generation · Applied AI Development

[← Back to Main Projects Portfolio](../README.md)
