# 💼 AI Career Coach Pro

**Generative AI · IBM watsonx.ai · Granite · Prompt Engineering · Gradio · Python · LLM Application Development**

> **Project Context:** IBM Generative AI Engineering Professional Certificate  
> **Project:** AI Career Coach Pro  
> **Focus:** LLM Integration · Prompt Engineering · Career-Application Automation · Profile-Aware Generation

AI Career Coach Pro is a multi-function Generative AI application for supporting job seekers across the application process.

Built with **Python**, **Gradio**, and **IBM watsonx.ai**, the application evolved from separate resume, cover-letter, and career-advice tools into a more integrated career toolkit centered on a reusable **Master Profile**. The current implementation can ingest candidate information, compare it with job descriptions, generate targeted application materials, provide LinkedIn strategy, and conduct interactive practice interviews.

---

## ⭐ Key Highlights

- Integrated **IBM watsonx.ai** foundation-model inference into a Python/Gradio application.
- Uses `ibm/granite-3-8b-instruct` in the current implementation.
- Built a reusable **Master Profile** as the application's source of truth.
- Supports profile ingestion from:
  - PDF resumes;
  - TXT files;
  - Markdown profile archives;
  - CSV data such as exported profile, experience, education, project, and skills records.
- Uses LLM-assisted parsing to transform unstructured resume text into structured profile sections.
- Generates complete job-targeted resumes using the candidate profile and job description.
- Performs ATS-style resume/job-description analysis.
- Generates customized cover letters grounded in stored candidate information.
- Produces LinkedIn profile strategy for broader recruiter visibility.
- Conducts interactive behavioral, technical/situational, and screening interviews.
- Generates post-interview scoring and coaching feedback.
- Supports multiple output languages.
- Exports generated content to Markdown and DOCX.
- Uses prompt constraints to reduce unsupported claims and keep generated application materials grounded in candidate data.

---

## 🎯 Project Objective

The project explores how a Large Language Model can support multiple stages of a job search through a unified application rather than isolated prompts.

The core workflow is:

```text
Candidate Information
        +
Target Role / Job Description
        ↓
Structured Master Profile
        ↓
IBM watsonx.ai LLM
        ↓
┌─────────────────────────────┐
│ Resume Analysis & Generation│
│ Cover Letter Generation     │
│ LinkedIn Strategy           │
│ Practice Interview          │
│ Interview Feedback          │
└─────────────────────────────┘
        ↓
Application-Specific Output
```

The emphasis is not simply on text generation, but on combining **structured candidate context, job-specific context, specialized prompts, output validation, and a usable interface**.

---

## 🧭 Project Evolution

The application was developed iteratively.

### Stage 1 — Individual Career Tools

The initial implementations treated career tasks separately.

Examples included:

- a resume-polishing application;
- a customized cover-letter generator;
- a career-advice application.

Each application connected a Gradio interface directly to an IBM watsonx.ai model.

### Stage 2 — Unified Career Coach

The separate functions were consolidated into a single tabbed Gradio application with shared model initialization.

This created one interface for:

```text
Resume Polishing
Cover Letters
Career Advice
```

### Stage 3 — Structured Analysis & Interview Preparation

The project was extended with:

- resume scoring;
- skill-gap analysis;
- structured JSON output;
- behavioral interview questions;
- technical interview questions;
- language selection.

### Stage 4 — Interactive Career Toolkit

A later version added:

- global language selection;
- a dedicated career chatbot;
- improved validation;
- stronger prompt constraints.

### Stage 5 — Master-Profile Architecture

The current implementation expands the project substantially by introducing a persistent in-session candidate profile that can be reused across the different career tools.

It also adds:

- PDF/TXT/MD/CSV ingestion;
- profile parsing and cleanup;
- certification-based skill enrichment;
- ATS-style analysis;
- full resume generation;
- LinkedIn strategy;
- interactive recruiter simulation;
- interview coaching;
- Markdown/DOCX output;
- profile archival.

This progression reflects a shift from **individual prompt-driven utilities** toward a more integrated **LLM-powered career workflow**.

---

# 🏗️ Current Application Architecture

```text
                         ┌───────────────────────┐
                         │     Candidate Data    │
                         │ PDF / TXT / MD / CSV  │
                         └───────────┬───────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │ Parsing & Formatting  │
                         │ LLM + Python Helpers  │
                         └───────────┬───────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │    Master Profile     │
                         │   Source of Truth     │
                         └───────────┬───────────┘
                                     │
                ┌────────────────────┼────────────────────┐
                │                    │                    │
                ▼                    ▼                    ▼
        Job Description       Target Position       Company / Context
                │                    │                    │
                └────────────────────┼────────────────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │   IBM watsonx.ai      │
                         │ Granite 3 8B Instruct │
                         └───────────┬───────────┘
                                     │
          ┌──────────────┬───────────┼───────────┬──────────────┐
          ▼              ▼           ▼           ▼              ▼
       Resume         Cover       LinkedIn    Practice       Interview
      Analysis        Letter      Strategy    Interview      Feedback
          │              │           │           │              │
          └──────────────┴───────────┴───────────┴──────────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │     Gradio UI         │
                         │ Review / Export       │
                         └───────────────────────┘
```

---

# 👤 Master Profile — Source of Truth

A major feature of the current application is the **Master Profile**.

Instead of requiring users to repeatedly paste the same resume into every tool, candidate information is stored in six structured sections:

```text
CONTACT
SUMMARY
EXPERIENCE
PROJECTS
EDUCATION
SKILLS
```

These values are stored using Gradio state components and reused by the generation functions.

The application combines them into a structured prompt context:

```text
--- CANDIDATE MASTER PROFILE START ---

CONTACT:
...

SUMMARY:
...

EXPERIENCE:
...

PROJECTS:
...

EDUCATION:
...

SKILLS:
...

--- CANDIDATE MASTER PROFILE END ---
```

This architecture improves consistency between generated resumes, cover letters, LinkedIn advice, and interview preparation.

---

## 📥 Profile Ingestion

The application supports several input formats.

| Format | Processing |
| --- | --- |
| **PDF** | Text extracted with `pypdf`, then segmented with the LLM |
| **TXT** | Text read directly and segmented with the LLM |
| **Markdown** | Existing Master Profile archive parsed into application sections |
| **CSV** | Structured records classified and routed into profile sections |

For raw PDF/TXT resumes, the LLM is instructed to return a JSON object containing:

```json
{
  "CONTACT_INFO": "...",
  "SUMMARY": "...",
  "EXPERIENCE": "...",
  "EDUCATION": "...",
  "SKILLS": "...",
  "PROJECTS": "..."
}
```

The application then validates and distributes the parsed content into the corresponding Gradio fields.

---

## 📊 CSV Processing

The current version also includes specialized processing for structured CSV data.

Depending on the file and selected destination, the application can format records into:

- contact/profile information;
- work experience;
- projects and awards;
- education and certifications;
- skills.

For ambiguous files, the user can select:

```text
Destination:
Experience / Projects / Education / Skills / Ignore

Action:
Overwrite / Append
```

This prevents automatically replacing existing profile information when the destination is uncertain.

---

## 🎓 Education Classification

Education and certification entries are classified heuristically into categories such as:

```text
Academic Degrees
Professional Certifications — Data Science / ML
Professional Certifications — Business / Leadership
Professional Certifications — Engineering
Professional Certifications — Teaching / Language
Professional Certifications — Other
```

Entries are then sorted using category priority and dates.

This allows a large candidate history to be reorganized into a more usable profile representation.

---

## 🧠 Certification-Based Skill Enrichment

The application can also use the LLM to identify technical skills strongly implied by education and certification records.

For example, a certification description may imply technologies or methods that are not explicitly listed in the candidate's skills section.

The workflow is:

```text
Existing Skills
      +
Education / Certifications
      ↓
LLM Skill Extraction
      ↓
Technical Skills Only
      ↓
Deduplication
      ↓
Enriched Skills Context
```

The enriched list is then available to resume-analysis and generation functions.

This is an experimental inference step rather than a replacement for user verification; inferred skills should be reviewed before being presented as demonstrated competencies.

---

# 📝 Resume Polisher

The Resume Polisher uses:

```text
Master Profile
      +
Target Position
      +
Job Description
      +
Resume Style
      +
Optional Instructions
```

to generate a complete targeted resume.

Supported style choices include:

- ATS Optimized;
- Chronological;
- Functional / Skills-Based;
- Hybrid.

The prompt asks the model to prioritize:

- relevant experience;
- measurable achievements;
- job-description alignment;
- relevant education and certifications;
- logically grouped skills;
- concise professional presentation.

The generated text is shown for review before export.

---

# 📈 ATS-Style Match Analysis

The application contains logic for comparing candidate information with a job description.

The intended analysis includes:

```text
Match Score
Missing / Underrepresented Keywords
Actionable Improvement Summary
```

A separate `analyze_resume_match()` implementation explicitly asks the LLM for:

```text
SCORE: [0-100]%
```

followed by missing keywords and recommendations.

> **Implementation note:** the current `get_match_score_wrapper()` contains a placeholder section (`[...] (The rest of your scoring prompt) [...]`). The repository therefore demonstrates the intended scoring workflow, but this wrapper should be completed before the score is treated as a finished application feature.

The score is an **LLM-generated heuristic**, not the output of an actual commercial Applicant Tracking System.

---

# ✉️ Cover Letter Generator

The Cover Letter Generator combines:

```text
Company
+
Target Position
+
Job Description
+
Master Profile
+
Selected Style
+
Language
```

The model is explicitly instructed to use qualifications and experience contained in the candidate's profile.

Supported styles include:

- ATS Optimized;
- Traditional Formal;
- Modern Brief.

The output can be reviewed in the interface and generated as a document.

A key design principle is grounding:

```text
Job Description tells the model what matters.
Master Profile tells the model what the candidate can legitimately claim.
```

---

# 🌐 LinkedIn & Networking Advisor

The current application includes a LinkedIn strategy module designed around broader professional positioning rather than a single vacancy.

It generates three components:

```text
1. Headline Strategy
2. About Section
3. Experience & Project Reframing
```

The prompt emphasizes:

- keyword-rich positioning;
- transferable skills;
- measurable achievements;
- cross-industry applicability;
- recruiter searchability.

This distinguishes the LinkedIn module from the resume generator: the resume is vacancy-specific, while the LinkedIn strategy is designed for broader professional discoverability.

---

# 🗣️ Practice Interview

The Practice Interview module uses the candidate's stored profile together with:

- target position;
- job description;
- interview type;
- selected language.

Available interview types include:

```text
Behavioral
Technical / Situational
General Screening
```

The model is instructed to behave as a professional recruiter and to:

1. use the candidate profile;
2. use the job description;
3. maintain the selected interview type;
4. ask concise questions;
5. move the interview forward;
6. avoid giving coaching feedback during the interview.

This creates a more realistic separation between **interview simulation** and **post-interview coaching**.

---

## 🎯 Interview Feedback

After a question-and-answer cycle, the application can analyze the interview transcript.

The coaching prompt asks for:

```text
Overall Score: [0-10]/10
Weakest Response
Rephrasing Advice
```

The model is also instructed to use the **STAR method** when appropriate.

This turns the interview component into a feedback loop:

```text
Practice
   ↓
Answer
   ↓
Continue Interview
   ↓
Transcript
   ↓
LLM Evaluation
   ↓
Weakness Identification
   ↓
Improved Response
```

---

# 🌍 Multilingual Generation

The current interface includes a global language selector with:

- English;
- Japanese;
- Spanish;
- French;
- German.

The selected language is passed to the major generation and analysis prompts.

This allows the same candidate profile to support applications and interview preparation in different languages.

---

# 📄 Document Generation & Archiving

Generated content can be exported in:

```text
Markdown (.md)
DOCX
```

The application includes formatting logic for:

- headings;
- bold text;
- lists;
- paragraph separation.

The Master Profile itself can also be archived and later reloaded from Markdown.

This provides a lightweight form of profile persistence without requiring a database.

---

# 🧹 Temporary File Management

The current implementation tracks temporary generated files and registers a cleanup function using:

```python
atexit.register(cleanup_temp_files)
```

This demonstrates attention to the lifecycle of generated application artifacts rather than leaving temporary output unmanaged.

---

# 💡 Prompt Engineering

Prompt engineering is central to the project.

Different tasks use different prompt structures rather than routing every request through one generic instruction.

| Module | Prompt Strategy |
| --- | --- |
| **Resume Parsing** | Strict JSON schema |
| **Skill Enrichment** | Technical-skill extraction with constrained output |
| **Resume Generation** | Role targeting + complete-document constraints |
| **ATS Analysis** | Comparative skill/keyword analysis |
| **Cover Letter** | Candidate/job synthesis with grounding constraints |
| **LinkedIn Strategy** | Cross-industry positioning and keyword optimization |
| **Interview** | Recruiter persona + conversational context |
| **Interview Feedback** | Evaluation + weakest-answer analysis + rephrasing |

Several prompts also contain explicit output rules such as:

```text
Return ONLY...
Do not include commentary...
Use the candidate profile...
Do not hallucinate experiences...
Return a valid JSON object...
```

These constraints improve downstream processing and reduce the amount of cleanup required after generation.

---

# 🔧 LLM Integration

The current application initializes IBM watsonx.ai with:

```python
model_id = "ibm/granite-3-8b-instruct"
project_id = "skills-network"
```

and uses:

```python
ModelInference
```

for chat-based generation.

The common wrapper:

```python
llm_chat(prompt, max_tokens=None)
```

provides a reusable interface for the different application modules.

Earlier versions of the project used:

```text
meta-llama/llama-3-2-11b-vision-instruct
```

through the same watsonx.ai environment.

The repository therefore also documents the project's progression across different foundation-model configurations.

---

# 🖥️ Gradio Interface

The application is organized into four major tabs:

| Tab | Purpose |
| --- | --- |
| **👤 Master Profile** | Build, edit, import, save, and archive candidate data |
| **📝 Resume Polisher** | Analyze job fit and generate a targeted resume |
| **✉️ Cover Letter Generator** | Generate job-specific application letters |
| **🌐 LinkedIn & Networking Advisor** | Improve broad professional positioning |
| **🗣️ Practice Interview** | Simulate interviews and generate coaching feedback |

The interface also uses:

- `gr.State` for candidate data;
- file-upload components;
- text areas;
- radio selectors;
- buttons;
- downloadable file outputs;
- `gr.ChatInterface` for conversational interviewing.

---

# 🛠️ Technical Stack

| Area | Technologies / Methods |
| --- | --- |
| **Programming** | Python |
| **Generative AI Platform** | IBM watsonx.ai |
| **Current Foundation Model** | IBM Granite 3 8B Instruct |
| **Earlier Model** | Meta Llama 3.2 11B Vision Instruct |
| **LLM SDK** | `ibm_watsonx_ai` |
| **Frontend / App Framework** | Gradio |
| **PDF Processing** | `pypdf` |
| **Structured Data** | pandas, NumPy |
| **Document Generation** | `python-docx` |
| **Structured LLM Output** | JSON |
| **Prompt Processing** | Python `re` / regex |
| **State Management** | Gradio State |
| **File Handling** | Python `os`, `atexit` |
| **Version Control** | Git / GitHub |

---

# 📂 Repository Structure

A representative project structure is:

```text
AI-Career-Coach-Pro/
│
├── career_coach_app.py
├── career_coach_app_final.py
├── career_coach_app_enhanced.py
│
├── resume_polisher.py
├── cover_letter.py
├── career_advisor.py
│
├── requirements.txt
├── README.md
│
└── [supporting project files]
```

The repository contains multiple versions that document the application's development from individual course exercises into the larger integrated implementation.

---

# ⚙️ Setup and Installation

## 1. Clone the Portfolio Repository

```bash
git clone https://github.com/GC2407CIZV/Projects.git
cd Projects
```

Navigate to the directory containing AI Career Coach Pro.

## 2. Create a Virtual Environment

### Linux / macOS

```bash
python3 -m venv my_env
source my_env/bin/activate
```

### Windows

```bash
python -m venv my_env
my_env\Scripts\activate
```

## 3. Install Dependencies

```bash
pip install -r requirements.txt
```

The supplied project requirements include:

```text
gradio
ibm-watsonx-ai
pypdf
pandas
fpdf2
python-docx
```

The current application also imports NumPy, so the environment must provide `numpy`; adding it explicitly to `requirements.txt` would make the dependency declaration more complete.

## 4. Run the Application

```bash
python career_coach_app.py
```

Gradio will provide the local application address after launch.

---

# 🔑 IBM watsonx.ai Access

The course implementation uses:

```python
project_id = "skills-network"
```

with:

```text
https://us-south.ml.cloud.ibm.com
```

This configuration is associated with the IBM Skills Network learning environment.

Running the project independently requires appropriate IBM watsonx.ai access and configuration.

For a production version, credentials and configuration should be externalized rather than embedded directly in application code.

---

# 🧩 Challenges & How I Addressed Them

| Challenge | Approach | What It Demonstrated |
| --- | --- | --- |
| **Supporting multiple career tasks** | Created specialized functions and prompts within one application | Modular LLM application design |
| **Avoiding repeated resume entry** | Introduced a reusable Master Profile | State and context management |
| **Parsing unstructured resumes** | Combined `pypdf` extraction with constrained JSON generation | LLM-assisted information extraction |
| **Handling different source formats** | Added PDF, TXT, MD, and CSV dispatch logic | File-processing architecture |
| **Handling ambiguous CSV imports** | Added destination and append/overwrite controls | User-controlled data integration |
| **Reusing certification information** | Added LLM-based technical-skill enrichment | Context enrichment |
| **Reducing unsupported claims** | Added profile-grounding instructions to prompts | Prompt safety and factuality |
| **Creating machine-readable output** | Required JSON for structured analysis | Structured generation |
| **Handling imperfect JSON** | Added extraction, cleanup, and parsing fallback logic | Defensive LLM integration |
| **Supporting multiple languages** | Passed a global language choice into task prompts | Multilingual generation |
| **Maintaining interview context** | Built conversation history and profile context into recruiter prompts | Conversational LLM design |
| **Separating interview and coaching modes** | Prevented feedback during simulation and analyzed the transcript afterward | Workflow design |
| **Generating usable documents** | Added Markdown and DOCX output | Document automation |
| **Managing generated files** | Added temporary-file cleanup | Application lifecycle management |

---

# ⚠️ Limitations & Critical Evaluation

## LLM-Generated ATS Scores

The application's match scores are generated by an LLM from candidate/job-description overlap.

They should therefore be interpreted as **heuristic guidance**, not as a simulation of the proprietary ranking algorithm used by a specific employer's ATS.

## Incomplete Match-Score Wrapper

The current `get_match_score_wrapper()` contains a placeholder where part of the scoring prompt would normally appear.

This should be completed before presenting that particular workflow as production-ready.

## Skill Inference Requires Verification

The certification-enrichment function asks the model to infer technical skills from education and certifications.

A certification may expose someone to a technology without proving professional proficiency in it. Inferred skills should therefore be reviewed by the user before being used in application materials.

## External Model Dependency

The application depends on IBM watsonx.ai and the model/environment configured for the project.

Service availability, model availability, credentials, or SDK changes may affect execution.

## LLM Output Variability

Generated resumes, cover letters, analyses, and interview feedback are probabilistic outputs.

Even strong prompts cannot guarantee:

- factual accuracy;
- identical output across runs;
- valid JSON in every case;
- perfect job-description interpretation.

## Profile Persistence

The current application uses Gradio state during execution and Markdown archival for later reuse.

It does not implement a database-backed user account or persistent profile store.

## File Parsing

PDF text extraction depends on the underlying PDF containing extractable text.

Scanned or unusually formatted resumes may not parse correctly.

## DOCX Formatting

The code itself labels DOCX output as less stable than Markdown output. The generated documents use relatively simple formatting and are not intended to replace a full document-layout engine.

## Interview Evaluation

Interview scores and coaching are generated by the LLM and should be treated as practice guidance rather than objective hiring predictions.

---

# 🚀 Future Improvements

Potential next steps include:

- complete and standardize the ATS scoring prompt;
- add explicit `numpy` dependency management;
- move watsonx.ai credentials and project configuration into environment variables;
- add a `.env.example` or configuration template;
- introduce automated tests for parsing and helper functions;
- mock LLM calls for deterministic unit testing;
- add integration tests for Gradio workflows;
- add stronger schema validation for structured LLM responses;
- use a formal data model for Master Profile fields;
- add DOCX resume parsing;
- support OCR as an optional path for scanned resumes;
- add secure persistent profile storage;
- add versioned profile snapshots;
- compare multiple target jobs against one profile;
- visualize skill gaps and job-match dimensions;
- add structured interview rubrics by competency;
- save interview transcripts and progress over time;
- separate application configuration, model services, business logic, and UI into modules;
- containerize the application;
- add CI-based linting and automated testing;
- deploy through a production-ready hosting environment.

---

# 🧠 What I Learned

## LLM Applications Benefit From Structured Context

The project began with simple task-specific prompts, but the larger application made clear that repeated generation becomes more consistent when all tools draw from a common structured profile.

```text
Unstructured Resume
        ↓
Structured Candidate Context
        ↓
Reusable LLM Workflows
```

## Prompt Engineering Is Application Logic

The prompts are not merely user-facing instructions.

They determine:

- what context the model receives;
- what claims it may make;
- what structure it returns;
- what language it uses;
- whether the output can be parsed programmatically.

For LLM applications, prompt design therefore becomes part of the software architecture.

## Structured Output Requires Defensive Programming

Requesting JSON does not guarantee valid JSON.

The project consequently introduced:

- code-fence removal;
- JSON-object extraction;
- parsing;
- fallback cleanup;
- error messages.

This is an important distinction between demonstrating an LLM call and engineering an application around one.

## Grounding Matters in Career Applications

Resume and cover-letter generation creates a particular factuality problem: a job description contains skills the employer wants, but those skills must not automatically become claims about the candidate.

The application therefore separates:

```text
Candidate Evidence → Master Profile
Employer Requirements → Job Description
```

and instructs the model to use the second to prioritize the first rather than inventing missing experience.

## AI Career Support Works Better as a Workflow

The strongest architectural lesson from the project is that career support is not one generation task.

It is a connected process:

```text
Build Profile
     ↓
Analyze Target Job
     ↓
Identify Alignment / Gaps
     ↓
Generate Resume
     ↓
Generate Cover Letter
     ↓
Improve Public Profile
     ↓
Practice Interview
     ↓
Analyze Performance
```

The project evolved toward supporting that workflow through a common candidate context.

---

# 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What is AI Career Coach Pro?** | A Gradio-based Generative AI application that supports multiple stages of job applications using IBM watsonx.ai |
| **Project context?** | IBM Generative AI Engineering Professional Certificate |
| **Current model?** | `ibm/granite-3-8b-instruct` |
| **Earlier model?** | `meta-llama/llama-3-2-11b-vision-instruct` |
| **Main framework?** | Gradio |
| **What is the Master Profile?** | A structured candidate-data source reused across resume, cover-letter, LinkedIn, and interview workflows |
| **What profile formats can it ingest?** | PDF, TXT, Markdown, and CSV |
| **How are PDF/TXT resumes structured?** | Extracted text is sent to the LLM with a strict JSON schema and distributed into six profile sections |
| **What are the six sections?** | Contact, Summary, Experience, Education, Skills, and Projects |
| **How does resume targeting work?** | The Master Profile is combined with a target position, job description, style, and generation constraints |
| **Does it use a real ATS?** | No. Match analysis is an LLM-generated heuristic based on job/profile overlap |
| **How do you reduce hallucinated experience?** | Prompts distinguish candidate evidence from employer requirements and instruct the model to ground claims in the Master Profile |
| **What does the cover-letter module use?** | Company, position, job description, candidate profile, style, and output language |
| **What does the LinkedIn module generate?** | Headline strategy, About-section draft, and reframed experience/project summaries |
| **How does interview practice work?** | The LLM receives the candidate profile, JD, role, interview type, language, and conversation history |
| **What interview modes are supported?** | Behavioral, Technical/Situational, and General Screening |
| **What feedback is produced?** | A score, weakest-response analysis, and improved phrasing |
| **How is structured output handled?** | JSON constraints plus parsing and cleanup logic |
| **What languages are supported in the current UI?** | English, Japanese, Spanish, French, and German |
| **What can be exported?** | Generated material and profile archives in Markdown and DOCX |
| **Main limitation?** | LLM outputs and scores remain probabilistic and require user review |
| **One current code issue?** | The ATS match-score wrapper still contains an unfinished placeholder prompt section |
| **What would you improve next?** | Complete scoring logic, formal schemas, automated tests, environment-based credentials, persistent profiles, and modular deployment architecture |
| **What does the project demonstrate?** | LLM integration, prompt engineering, structured generation, file processing, state management, Gradio development, career-workflow design, and responsible grounding |

---

# 🎓 Project Context

This project was developed as part of the:

**IBM Generative AI Engineering Professional Certificate**

and builds on exercises involving LLM-powered applications with IBM watsonx.ai and Gradio.

The project demonstrates practical work across:

**Generative AI · Large Language Models · IBM watsonx.ai · Granite · Llama · Prompt Engineering · Python · Gradio · JSON · PDF Processing · Structured Data · Document Generation · Conversational AI**

---

# 📄 Educational & Portfolio Use

This repository is presented for **educational and portfolio purposes**.

It documents both the original course-oriented implementations and subsequent development into a more integrated career-support application.

IBM watsonx.ai, IBM Granite, Meta Llama, Gradio, and other third-party technologies remain subject to their respective licenses, terms, and ownership.

---

# 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Data Visualization · Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
