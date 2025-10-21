'''Deploy a Flask application that will allow a user to provide
a text string which will then be analyzed to determine which emotion amongst a set of 5
most likely emotions being conveyed by the given text.
'''

from flask import Flask, request, render_template
from EmotionDetection.emotion_detection import emotion_detector

app = Flask("Emotion Detector") # Initializes the Flask application

@app.route("/emotionDetector") # Defines the API endpoint for emotion analysis
def emotion_analyzer():
    '''Retrieve the provided text string from the user, then pass the text
    to be analyzed by the emotion detector. Finally, return a response displaying
    the confidence scores across all emotions and the dominant emotion.
    '''
    text_to_analyse = request.args.get('textToAnalyze') # Gets text from URL query parameter
    emotion_result = emotion_detector(text_to_analyse) # Runs the emotion detection model

    # Extracts all scores and the dominant emotion from the result dictionary
    if emotion_result['dominant_emotion'] is not None:
        anger = emotion_result['anger']
        disgust = emotion_result['disgust']
        fear = emotion_result['fear']
        joy = emotion_result['joy']
        sadness = emotion_result['sadness']
        dominant_emotion = emotion_result['dominant_emotion']

        response_str = f"""For the given statement, the system response is
        'anger': {anger}, 'disgust': {disgust}, 'fear': {fear}, 'joy': {joy}, 'sadness': {sadness}.
        The dominant emotion is <strong>{dominant_emotion}</strong>."""
        return response_str

    return "Invalid text! Please try again!"

@app.route("/") # Defines the route for the main landing page
def render_index_page():
    '''Render the index page to the user, this is where the text string to be
    analyzed is provided and a response is displayed back to the user.
    '''
    return render_template('index.html') # Renders the HTML template

if __name__ == "__main__": # Ensures the server runs only when the script is executed directly
    app.run(host="0.0.0.0", port=5000)
