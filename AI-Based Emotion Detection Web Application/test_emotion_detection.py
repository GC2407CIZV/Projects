from EmotionDetection.emotion_detection import emotion_detector
import unittest

# Defines a test class. All test classes must inherit from unittest.TestCase.
class TestEmotionAnalyzer(unittest.TestCase):
    
    # All test methods must start with the prefix 'test_'.
    def test_dominant_emotions(self):
        """
            This method groups multiple checks to verify that the emotion_detector
            function correctly identifies the dominant emotion for key inputs.
        """
    
        self.assertEqual(emotion_detector("I am glad this happened")['dominant_emotion'], "joy")
        self.assertEqual(emotion_detector("I am really mad about this")['dominant_emotion'], "anger")
        self.assertEqual(emotion_detector("I feel disgusted just hearing about this")['dominant_emotion'], "disgust")
        self.assertEqual(emotion_detector("I am so sad about this")['dominant_emotion'], "sadness")
        self.assertEqual(emotion_detector("I am really afraid that this will happen")['dominant_emotion'], "fear")

# Standard boilerplate code: runs all tests defined in this file when the script is executed directly.
if __name__ == '__main__':
    unittest.main()