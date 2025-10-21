import json
import requests

def emotion_detector(text_to_analyse):
    # Define the URL for the sentiment analysis API
    url = 'https://sn-watson-emotion.labs.skills.network/v1/watson.runtime.nlp.v1/NlpService/EmotionPredict'

    # Set the headers with the required model ID for the API
    headers = {"grpc-metadata-mm-model-id": "emotion_aggregated-workflow_lang_en_stock"}
    
    # Create the payload with the text to be analyzed
    input_json = { "raw_document": { "text": text_to_analyse } }
    
    # Make a POST request to the API with the payload and headers
    response = requests.post(url, json = input_json, headers=headers)

    # Parse the response from the API
    formatted_response = json.loads(response.text)

    # If the response status code is 200, extract the laemotions and emotion scores from the response
    if response.status_code == 200:
        emotion_result = formatted_response['emotionPredictions'][0]['emotion']
        anger_score = emotion_result['anger'],
        disgust_score = emotion_result['disgust'],
        fear_score = emotion_result['fear'],
        joy_score = emotion_result['joy'],
        sadness_score = emotion_result['sadness'],
        dominant_emotion = max(emotion_result, key=emotion_result.get)
        return {
            'anger': anger_score,
            'disgust': disgust_score,
            'fear': fear_score,
            'joy': joy_score,
            'sadness': sadness_score,
            'dominant_emotion': dominant_emotion
        }
    
    elif response.status_code == 400:
        anger_score = None,
        disgust_score = None,
        fear_score = None,
        joy_score = None,
        sadness_score = None,
        dominant_emotion = None
        return {
            'anger': anger_score,
            'disgust': disgust_score,
            'fear': fear_score,
            'joy': joy_score,
            'sadness': sadness_score,
            'dominant_emotion': dominant_emotion
        }       

    return {"emotions": None}
