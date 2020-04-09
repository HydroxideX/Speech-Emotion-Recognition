# Speech Emotion Recognition

## Introduction
- We built a neural network from scratch using Octave that predicts human emotion from his speach ith a 70.909% accuracy.
- We created a python application that predicts human emotion given a ".wav" audio file.
 

## Python Packages used
- **librosa==0.6.3**
- **numpy**
- **sklearn.model_selection**

## To use the application
- open Gui.pwy
- browse a ".wav" audio file
- an emoji will appear predicting the emotion of that file.


## Dataset
We used 2 datasets :
- [**RAVDESS**](https://zenodo.org/record/1188976) : The Ryerson Audio-Visual Database of Emotional Speech and Song (RAVDESS) contains 24 professional actors (12 female, 12 male), vocalizing two lexically-matched statements in a neutral North American accent. Speech includes calm, happy, sad, angry, fearful, surprise, and disgust expressions.
- [**TESS**](https://tspace.library.utoronto.ca/handle/1807/24487) :A set of 200 target words were spoken in the carrier phrase "Say the word _____' by two actresses (aged 26 and 64 years) and recordings were made of the set portraying each of seven emotions (anger, disgust, fear, happiness, pleasant surprise, sadness, and neutral).


### To load and split the data
```python
from numpy import loadtxt
from sklearn.model_selection import train_test_split
X= loadtxt('X.csv', delimiter=',')
y= loadtxt('y.csv', delimiter=',')
X_train,X_test,y_train,y_test=train_test_split(X,y,random_state=0)

```

## Emotions
"neutral", "calm", "happy" "sad", "angry", "fear", "disgust" and "pleasant surprise".



## Feature Extraction

We used the feature extractions available in [librosa](https://github.com/librosa/librosa) library including:
- MFCC
- Chromagram 
- MEL Spectrogram Frequency (mel)
- Contrast
- Tonnetz (tonal centroid features)





