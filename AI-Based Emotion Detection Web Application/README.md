# 😊 AI-Based Emotion Detection Web Application

**Natural Language Processing · Generative AI Engineering · Python · Flask · REST API Integration · Watson NLP · Unit Testing**

> **Project Context:** IBM Generative AI Engineering Professional Certificate  
> **Capstone:** Developing AI Applications with Python and Flask  
> **Focus:** NLP Integration · Python Packaging · Full-Stack AI Application Development

A full-stack AI web application that analyzes user-provided text and identifies its **dominant emotion** using an IBM Watson NLP emotion-detection service.

The application connects a browser-based interface to a Flask backend and a reusable Python package, returning scores for **anger, disgust, fear, joy, and sadness** together with the dominant detected emotion.

---

## ⭐ Key Highlights

- Integrated an **IBM Watson NLP emotion-detection endpoint** into a Python application.
- Built a reusable `EmotionDetection` Python package around the core NLP logic.
- Extracted five emotion scores:
  - anger;
  - disgust;
  - fear;
  - joy;
  - sadness.
- Determined the **dominant emotion** from the returned model scores.
- Developed a **Flask** backend with separate interface and analysis routes.
- Connected the browser interface to the backend using **JavaScript XMLHttpRequest**.
- Implemented graceful handling of invalid or blank text input.
- Created unit tests covering all five supported dominant emotions.
- Structured the project using separate package, template, static-asset, test, and application layers.
- Completed static code analysis with **PyLint** as part of the capstone workflow.

---

## 🎯 Project Objective

The goal was to build an AI application that accepts natural-language text and determines the emotion most strongly expressed in that text.

For example:

```text
"I am glad this happened"
            ↓
     Emotion Detection
            ↓
anger   → score
disgust → score
fear    → score
joy     → score
sadness → score
            ↓
Dominant Emotion: joy
```

The project goes beyond calling an NLP service directly. It packages the AI functionality and integrates it into a complete web application.

---

## 🏗️ Application Architecture

The application follows a simple layered architecture:

```text
User
  ↓
HTML / Bootstrap Interface
  ↓
JavaScript Request
  ↓
Flask `/emotionDetector` Route
  ↓
EmotionDetection Python Package
  ↓
Watson NLP Emotion Endpoint
  ↓
Emotion Scores
  ↓
Dominant Emotion
  ↓
Formatted Flask Response
  ↓
Browser Interface
```

This separation keeps the **AI logic**, **web server**, and **user interface** distinct.

---

## 🧠 Emotion Detection

The core function is:

```python
emotion_detector(text_to_analyse)
```

It sends the supplied text to the Watson NLP emotion endpoint and processes the returned response.

The application works with five emotions:

| Emotion | Description |
| --- | --- |
| **Anger** | Degree to which the text expresses anger |
| **Disgust** | Degree to which the text expresses disgust |
| **Fear** | Degree to which the text expresses fear |
| **Joy** | Degree to which the text expresses joy |
| **Sadness** | Degree to which the text expresses sadness |

The dominant emotion is selected from the highest returned emotion score.

Conceptually:

```python
dominant_emotion = max(emotion_result, key=emotion_result.get)
```

The processed result is structured as:

```python
{
    "anger": ...,
    "disgust": ...,
    "fear": ...,
    "joy": ...,
    "sadness": ...,
    "dominant_emotion": ...
}
```

---

## 🔌 NLP Service Integration

The project communicates with the course-provided Watson NLP service through an HTTP `POST` request.

The request contains the text in JSON format:

```python
{
    "raw_document": {
        "text": text_to_analyse
    }
}
```

and specifies the required emotion model through the request headers.

The response is parsed from JSON and converted into a simpler application-specific dictionary before being returned to the Flask layer.

This demonstrates the common AI application pattern:

```text
Application
    ↓
External AI Service
    ↓
Raw Model Response
    ↓
Application-Specific Processing
    ↓
Usable Result
```

---

## 📦 Python Packaging

The core AI functionality is separated into its own package:

```text
EmotionDetection/
├── __init__.py
└── emotion_detection.py
```

The Flask application imports the detector with:

```python
from EmotionDetection.emotion_detection import emotion_detector
```

Separating the model-integration logic from the web server makes the project easier to test, maintain, and extend.

---

## 🌐 Flask Web Application

The backend is implemented in:

```text
server.py
```

Two main routes are defined.

### Main Interface

```text
/
```

renders the HTML interface:

```python
@app.route("/")
def render_index_page():
    return render_template("index.html")
```

### Emotion Analysis Endpoint

```text
/emotionDetector
```

retrieves the user's text from the query parameter:

```python
request.args.get("textToAnalyze")
```

and passes it to:

```python
emotion_detector()
```

The resulting emotion scores and dominant emotion are then formatted and returned to the browser.

---

## 🖥️ Front-End Integration

The user interface is implemented with:

- HTML;
- Bootstrap;
- JavaScript.

The page contains a text input where the user enters the statement to analyze.

JavaScript reads the input and sends an asynchronous request to:

```text
emotionDetector?textToAnalyze=<user text>
```

The returned response is inserted into the page without requiring a full page reload.

This provides a simple end-to-end interaction:

```text
Enter Text
    ↓
Click Analyze
    ↓
JavaScript Request
    ↓
Flask
    ↓
Watson NLP
    ↓
Flask Response
    ↓
Result Displayed
```

---

## 🧪 Unit Testing

The project includes:

```text
test_emotion_detection.py
```

using Python's built-in:

```python
unittest
```

The tests verify the dominant emotion for representative statements.

| Test Statement | Expected Emotion |
| --- | --- |
| `I am glad this happened` | `joy` |
| `I am really mad about this` | `anger` |
| `I feel disgusted just hearing about this` | `disgust` |
| `I am so sad about this` | `sadness` |
| `I am really afraid that this will happen` | `fear` |

Tests can be executed with:

```bash
python test_emotion_detection.py
```

Testing the core function separately from Flask helps validate the AI integration independently from the user interface.

---

## 🛡️ Error Handling

The application also handles invalid input.

When the NLP service returns an invalid-input response, the detector returns a result with no dominant emotion.

The Flask layer checks:

```python
if emotion_result["dominant_emotion"] is not None:
```

If no valid dominant emotion is available, the application returns:

```text
Invalid text! Please try again!
```

This prevents blank input from producing a misleading emotion result.

---

## 🔎 Static Code Analysis

The capstone also included static code analysis using:

```bash
pylint server.py
```

The Flask application includes function documentation and was refined as part of the course's code-quality task.

This stage reinforced that an AI application should be evaluated not only for model functionality, but also for **software quality and maintainability**.

---

## 🧩 Challenges & How I Addressed Them

| Challenge | How I Addressed It | What It Demonstrated |
| --- | --- | --- |
| **Connecting Python to an NLP model** | Sent structured HTTP requests to the Watson NLP endpoint | AI/API integration |
| **Transforming a complex API response** | Parsed JSON and extracted the five relevant emotion scores | Data extraction |
| **Determining the final classification** | Selected the emotion with the highest model score | Model-output interpretation |
| **Keeping AI logic reusable** | Moved detection logic into an `EmotionDetection` package | Modular Python design |
| **Connecting AI logic to a browser** | Created Flask routes around the packaged detector | Backend development |
| **Updating the page without a reload** | Used JavaScript `XMLHttpRequest` | Frontend/backend integration |
| **Handling blank input** | Added service-response and Flask-level error handling | Defensive programming |
| **Verifying model integration** | Added unit tests for all five target emotions | Software testing |
| **Maintaining code quality** | Applied PyLint and function documentation | Static analysis |
| **Organizing a multi-component application** | Separated package, server, templates, static files, tests, and documentation | Application architecture |

---

## 🛠️ Technical Stack

| Area | Technologies & Methods |
| --- | --- |
| **Programming** | Python |
| **AI / NLP** | IBM Watson NLP emotion detection |
| **API Communication** | Requests |
| **Data Format** | JSON |
| **Backend** | Flask |
| **Frontend** | HTML, Bootstrap |
| **Client-Side Logic** | JavaScript, XMLHttpRequest |
| **Testing** | Python `unittest` |
| **Code Quality** | PyLint |
| **Packaging** | Python package structure |
| **Version Control** | Git / GitHub |

---

## 📂 Repository Structure

```text
final_project/
│
├── EmotionDetection/
│   ├── __init__.py
│   └── emotion_detection.py
│
├── Screenshots/
│
├── TaskFiles/
│
├── static/
│   └── mywebscript.js
│
├── templates/
│   └── index.html
│
├── PROJECT_GUIDE.md
├── server.py
├── test_emotion_detection.py
├── .gitignore
└── README.md
```

### Key Files

**`EmotionDetection/emotion_detection.py`**  
Contains the core `emotion_detector()` function and Watson NLP integration.

**`EmotionDetection/__init__.py`**  
Initializes the Python package.

**`server.py`**  
Runs the Flask application and connects HTTP requests to the emotion detector.

**`templates/index.html`**  
Provides the browser-based user interface.

**`static/mywebscript.js`**  
Sends the user's text to the Flask endpoint and displays the returned result.

**`test_emotion_detection.py`**  
Contains unit tests for the five target emotions.

**`PROJECT_GUIDE.md`**  
Documents the capstone tasks and development workflow.

**`Screenshots/`**  
Contains evidence captured during the course assessment.

**`TaskFiles/`**  
Contains task-specific and intermediate project files.

---

## ⚙️ Running the Project

### Prerequisites

The project requires:

- Python 3;
- Flask;
- Requests;
- access to the Watson NLP endpoint used by the original course environment.

### Clone the Portfolio Repository

```bash
git clone https://github.com/GC2407CIZV/Projects.git
cd Projects
```

Then navigate to the directory containing this project.

### Install Core Dependencies

```bash
pip install flask requests
```

### Run the Unit Tests

```bash
python test_emotion_detection.py
```

### Start the Flask Application

```bash
python server.py
```

The application is configured to run on:

```text
0.0.0.0:5000
```

> The Watson NLP endpoint used by the original implementation is course-provided infrastructure. Availability outside the original IBM Skills Network environment may therefore differ.

---

## ⚠️ Limitations & Critical Evaluation

### External Service Dependency

The application depends on the Watson NLP endpoint supplied for the course.

If that endpoint becomes unavailable or is restricted to the course environment, the original application will no longer perform inference without replacing the NLP service.

### Five-Emotion Classification

The application is limited to:

```text
anger
disgust
fear
joy
sadness
```

Human emotional expression is substantially more complex than five discrete categories.

### Model Output Is Predictive

The detected emotion represents the model's interpretation of the supplied text.

It should not be treated as a definitive assessment of a person's actual emotional or psychological state.

### Basic Front-End Architecture

The interface intentionally remains simple because the focus of the capstone was AI application integration rather than advanced front-end development.

### Test Coverage

The existing unit tests verify representative examples for each dominant emotion, but they do not provide comprehensive coverage of:

- blank input;
- malformed service responses;
- network failures;
- Flask routes;
- unusual or ambiguous language.

### API Robustness

A production implementation would require stronger handling of:

- request timeouts;
- connection failures;
- unexpected status codes;
- malformed JSON;
- service availability.

---

## 🔄 Future Improvements

If I extended the project today, I would:

- replace or abstract the course-specific NLP endpoint;
- add request timeouts and robust exception handling;
- validate user input before making an external request;
- add tests for invalid and empty input;
- mock the external NLP service during unit testing;
- add Flask route and integration tests;
- separate API response formatting from route logic;
- add structured JSON API responses;
- improve the front-end experience;
- replace `XMLHttpRequest` with a modern `fetch()` implementation;
- add logging;
- create a `requirements.txt`;
- configure environment variables for external service settings;
- containerize the application;
- add CI-based automated testing and linting;
- evaluate alternative transformer-based emotion-classification models;
- deploy the application using a production WSGI server.

---

## 🧠 What I Learned

This project was useful because it connected **AI model functionality with software engineering**.

### AI Applications Require More Than a Model

The NLP service performs the emotion analysis, but building an application around it required several additional layers:

```text
AI Model
   +
API Integration
   +
Python Packaging
   +
Backend
   +
Frontend
   +
Testing
   +
Error Handling
   +
Code Quality
   ↓
Usable AI Application
```

### Model Output Must Be Transformed for the Application

External AI services often return responses designed for general-purpose use rather than for a specific application.

The project required extracting the relevant values and transforming them into a predictable internal structure before the Flask application could use them.

### Modular Design Improves Maintainability

Separating `emotion_detector()` from the Flask server made it possible to test the core functionality independently.

That separation also makes it easier to replace the underlying NLP provider without redesigning the entire interface.

### Testing AI Integrations Is Important

The unit tests verify that representative inputs produce the expected dominant emotions.

The project also highlighted an important next step for production systems: external AI services should normally be **mocked during automated unit testing** so tests remain deterministic and independent of network availability.

### Error Handling Is Part of the User Experience

A blank text field is a simple example, but it demonstrates a broader principle: AI applications need to anticipate invalid inputs and service failures rather than assuming every inference request will succeed.

---

## 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What was the project?** | A full-stack NLP web application that detects emotions in user-provided text |
| **Project context?** | IBM Generative AI Engineering Professional Certificate |
| **Capstone/course?** | Developing AI Applications with Python and Flask |
| **What emotions does it detect?** | Anger, disgust, fear, joy, and sadness |
| **How is the dominant emotion selected?** | The application selects the emotion with the highest returned score |
| **What provides the NLP inference?** | A course-provided IBM Watson NLP emotion-detection endpoint |
| **Backend?** | Flask |
| **Frontend?** | HTML and Bootstrap with JavaScript |
| **How does the browser communicate with Flask?** | JavaScript sends an asynchronous request to `/emotionDetector` |
| **How is the AI logic organized?** | In a reusable `EmotionDetection` Python package |
| **How did you test it?** | Python `unittest` with representative statements for all five emotions |
| **How is invalid input handled?** | The detector returns no dominant emotion and Flask displays an invalid-text message |
| **Did you perform code-quality checks?** | Yes, static analysis with PyLint was part of the capstone workflow |
| **Main engineering challenge?** | Connecting the NLP service, reusable Python logic, Flask backend, and browser interface into one workflow |
| **Main limitation?** | Dependence on the course-provided Watson NLP endpoint |
| **What would you improve today?** | Stronger exception handling, mocked tests, Flask integration tests, structured APIs, environment configuration, CI, and deployment |
| **What does the project demonstrate?** | AI/API integration, Python packaging, Flask development, frontend/backend integration, testing, error handling, and code quality |

---

## 🎓 Project Context

This project was completed as part of the:

**IBM Generative AI Engineering Professional Certificate**

within the **Developing AI Applications with Python and Flask** course.

The capstone development workflow covered:

**AI Application Development · NLP Integration · Python · REST/API Communication · JSON Processing · Python Packaging · Unit Testing · Flask Deployment · Frontend/Backend Integration · Error Handling · Static Code Analysis**

---

## 📄 Educational & Portfolio Use

This repository is presented for **educational and portfolio purposes**.

The implementation demonstrates my work integrating NLP functionality into a packaged Python module and deploying it through a Flask web application.

Course materials, IBM services, external libraries, and other third-party components remain subject to their respective licenses, terms, and ownership.

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Data Visualization · Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
