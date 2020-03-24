import librosa
import soundfile
import os
import numpy as np
import WriteVectorForOctave


def extract_feature(file_name):
    with soundfile.SoundFile(file_name) as sound_file:
        X = sound_file.read(dtype="float32")
        sample_rate = sound_file.samplerate
        stft = np.abs(librosa.stft(X))
        result = np.array([])
        mfccs = np.mean(librosa.feature.mfcc(y=X, sr=sample_rate, n_mfcc=40).T, axis=0)
        result = np.hstack((result, mfccs))
        chroma = np.mean(librosa.feature.chroma_stft(S=stft, sr=sample_rate).T, axis=0)
        result = np.hstack((result, chroma))
        mel = np.mean(librosa.feature.melspectrogram(X, sr=sample_rate).T, axis=0)
        result = np.hstack((result, mel))
        return result


X = []
for i in range(1, 25):
    myDir = 'Audio/Actor_'
    if i < 10:
        myDir += '0'
        myDir += str(i)
    if i > 9:
        myDir += str(i)
    print(myDir)
    directory = os.fsencode(myDir)
    for file in os.listdir(directory):
        filename = os.fsdecode(file)
        if filename.endswith(".wav") or filename.endswith(".py"):
            v = extract_feature(myDir+'/'+filename)
            X.append(v)

WriteVectorForOctave.write(X)

