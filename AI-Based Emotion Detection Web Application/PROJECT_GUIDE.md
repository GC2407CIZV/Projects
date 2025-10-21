# 📚 Detailed Project Guide: AI-Based Web Application Development and Deployment

This guide provides step-by-step instructions for completing the Final Project tasks. Follow the instructions carefully and capture all required screenshots with the specified filenames.

---

## 🕒 Estimated Time: 1 hour 45 minutes

## 🎯 Project Objectives

To create and deploy an **Emotion Detection System** as a web application using Flask, integrating an embedded Watson NLP library to perform analytics on customer feedback.

---

## Task 1: Fork and Clone the Project Repository

1.  **Fork the Repository:** Visit the project URL: `https://github.com/ibm-developer-skills-network/oaqjp-final-project-emb-ai.git`. Click the **Fork** button to create a copy in your GitHub account.
    * *Note: Ensure your forked repository is Public.*
2.  **Prepare Directory:** Open a new Terminal in the Skills Network Theia Lab environment.
    ```bash
    mkdir final_project
    ```
3.  **Clone the Repository:** Clone your *forked* GitHub repository into the new `final_project` folder.
    ```bash
    git clone [YOUR_FORKED_REPO_URL] final_project
    ```
4.  **Change Directory:** Navigate into the project folder.
    ```bash
    cd final_project
    ```
5.  **Screenshot:** Take a screenshot of your initial folder structure and save it as **`1_folder_structure.png`**.

---

## Task 2: Create an Emotion Detection Application using Watson NLP

1.  **Create File:** Create a file named **`emotion_detection.py`** inside the `final_project` directory.
2.  **Define Function:** In `emotion_detection.py`, write the function `emotion_detector(text_to_analyze)`. This function will make a POST request to the Watson NLP Emotion Predict function.
    * **URL:** `'https://sn-watson-emotion.labs.skills.network/v1/watson.runtime.nlp.v1/NlpService/EmotionPredict'`
    * **Headers:** `{"grpc-metadata-mm-model-id": "emotion_aggregated-workflow_lang_en_stock"}`
    * **Input JSON:** `{ "raw_document": { "text": text_to_analyse } }`
    * *Note: The function must return the raw `text` attribute of the response object.*
3.  **Screenshot:** Take a screenshot of the code you write and save it as **`2a_emotion_detection.png`**.
4.  **Test Application:** Open a `python3` shell in the terminal.
    * Import the function (e.g., `from emotion_detection import emotion_detector`).
    * Test with the statement: **`“I love this new technology.”`**
5.  **Screenshot:** Take a screenshot of the terminal shell showing the import, the test run, and the output. Name it **`2b_application_creation.png`**.
    * *If `ModuleNotFoundError: No module named 'requests'` occurs, run `python3 -m pip install requests`.*

---

## Task 3: Format the Output of the Application

1.  **Modify `emotion_detector`:** Update the function in `emotion_detection.py` to:
    * Convert the raw response text into a dictionary using the `json` library.
    * Extract scores for `anger`, `disgust`, `fear`, `joy`, and `sadness`.
    * Determine the **`dominant_emotion`** (the emotion with the highest score).
    * Return the final dictionary in the required format:
        ```python
        {
        'anger': anger_score,
        'disgust': disgust_score,
        'fear': fear_score,
        'joy': joy_score,
        'sadness': sadness_score,
        'dominant_emotion': '<name of the dominant emotion>'
        }
        ```
2.  **Screenshot:** Take a screenshot of the modified function code and save it as **`3a_output_formatting.png`**.
3.  **Test Formatted Output:** Open a `python3` shell.
    * Run the function with the statement: **`I am so happy I am doing this.`**
    * Verify that the `dominant_emotion` is **`joy`**.
4.  **Screenshot:** Take a screenshot of the terminal output and save it as **`3b_formatted_output_test.png`**.

---

## Task 4: Package the Application

1.  **Create Package:** Create a folder named **`EmotionDetection`** (the package name).
2.  **Move Files:** Move `emotion_detection.py` into the `EmotionDetection` folder.
3.  **Create Init File:** Create an empty file named **`__init__.py`** inside the `EmotionDetection` folder to make it a valid Python package.
4.  **Screenshot:** Take a screenshot showing the contents of the `__init__.py` file (which can be empty) *and* the final project folder structure. Name it **`4a_packaging.png`**.
5.  **Test Package:** Open a `python3` shell.
    * Import the function from the package: `from EmotionDetection.emotion_detection import emotion_detector`.
    * Test run the function with: **`I hate working long hours.`**
    * Verify the dominant emotion is **`anger`**.
6.  **Screenshot:** Take a screenshot of the terminal output and save it as **`4b_packaging_test.png`**.

---

## Task 5: Run Unit Tests on Your Application

1.  **Create Test File:** Create a new file named **`test_emotion_detection.py`** in the root `final_project` directory.
2.  **Write Unit Tests:** Write a unit test class that calls the `emotion_detector` function and tests it against the following expected dominant emotions:

| Statement | Dominant Emotion |
| :--- | :--- |
| `I am glad this happened` | `joy` |
| `I am really mad about this` | `anger` |
| `I feel disgusted just hearing about this` | `disgust` |
| `I am so sad about this` | `sadness` |
| `I am really afraid that this will happen` | `fear` |

3.  **Screenshot:** Take a screenshot of the code in `test_emotion_detection.py` and save it as **`5a_unit_testing.png`**.
4.  **Execute Tests:** Run the unit test file on the terminal.
    ```bash
    python test_emotion_detection.py
    ```
5.  **Screenshot:** Take a screenshot of the terminal output showing that the unit tests have passed. Name it **`5b_unit_testing_result.png`**.

---

## Task 6: Web Deployment of the Application using Flask

1.  **Create Server File:** Create the **`server.py`** file in the root `final_project` folder.
2.  **Implement Routes:**
    * Create a route (`@app.route("/")`) to render the `index.html` template.
    * Create the main API route (`@app.route("/emotionDetector")`) that:
        * Retrieves text from the query parameter (`request.args.get('textToAnalyze')`).
        * Calls `emotion_detector()` to get the result dictionary.
        * Formats the response string to match the required example:
            `For the given statement, the system response is 'anger': <score>, 'disgust': <score>, ..., 'sadness': <score>. The dominant emotion is <strong><emotion></strong>.`
    * Deploy the application on `localhost:5000` (`if __name__ == "__main__":`).
3.  **Screenshot:** Take a screenshot of the final contents of **`server.py`** and save it as **`6a_server.png`**.
4.  **Deploy and Test:** Run `python server.py`. Access the app in a browser.
    * Test for the statement: **`I think I am having fun`**.
5.  **Screenshot:** Take a screenshot of the final deployed application interface showing the result for the test statement. Name it **`6b_deployment_test.png`**.

---

## Task 7: Incorporate Error Handling

1.  **Modify `emotion_detector` (Task 7a):**
    * In `emotion_detection.py`, check the `status_code` of the response.
    * If `status_code = 400` (indicating blank or invalid entry), return the result dictionary with all values (`anger`, `disgust`, `fear`, `joy`, `sadness`, `dominant_emotion`) set to **`None`**.
2.  **Screenshot:** Take a screenshot of the modified `emotion_detector` function and name it **`7a_error_handling_function.png`**.
3.  **Modify `server.py` (Task 7b):**
    * In the `/emotionDetector` route in `server.py`, add logic to check if `dominant_emotion` is `None`.
    * If it is `None`, the function must return the message: **`Invalid text! Please try again`**.
4.  **Screenshot:** Take a screenshot of the modified `server.py` file and save it as **`7b_error_handling_server.png`**.
5.  **Test Error Handling (Task 7c):** Deploy the application and test it for **blank entries** (i.e., submit an empty text box).
6.  **Screenshot:** Take a screenshot of the interface displaying the error message **`Invalid text! Please try again!`**. Name it **`7c_error_handling_interface.png`**.

---

## Task 8: Run Static Code Analysis

1.  **Analyze `server.py`:** Run PyLint on the `server.py` file.
    ```bash
    pylint server.py
    ```
2.  **Achieve 10/10 Score (Task 8a):** Modify `server.py` to address all PyLint complaints and achieve a score of **10/10**. This usually involves adding **Docstrings** to all functions.
3.  **Screenshot:** Take a screenshot of the modified `server.py` file (with Docstrings) and name it **`8a_server_modified.png`**.
4.  **Screenshot:** Run PyLint again and take a screenshot of the terminal output showing the **10/10 score**. Name it **`8b_static_code_analysis.png`**.

---

## 📸 Required Screenshot Checklist

Ensure you have captured and correctly named all 16 required screenshots:

| Task | File Name |
| :--- | :--- |
| **Task 1** | `1_folder_structure.png` |
| **Task 2** | `2a_emotion_detection.png` |
| | `2b_application_creation.png` |
| **Task 3** | `3a_output_formatting.png` |
| | `3b_formatted_output_test.png` |
| **Task 4** | `4a_packaging.png` |
| | `4b_packaging_test.png` |
| **Task 5** | `5a_unit_testing.png` |
| | `5b_unit_testing_result.png` |
| **Task 6** | `6a_server.png` |
| | `6b_deployment_test.png` |
| **Task 7** | `7a_error_handling_function.png` |
| | `7b_error_handling_server.png` |
| | `7c_error_handling_interface.png` |
| **Task 8** | `8a_server_modified.png` |
| | `8b_static_code_analysis.png` |
