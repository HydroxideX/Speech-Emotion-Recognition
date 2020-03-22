import librosa
import soundfile
import os, glob, pickle
import numpy as np

f = open("Data.mat", "w")
def write(a):
    for i in range(len(a)):
        for j in range(len(a[0])):
            f.write(" ")
            f.write(str(a[i][j]))
        f.write("\n")



def extract_feature(file_name):
    with soundfile.SoundFile(file_name) as sound_file:
        X = sound_file.read(dtype="float32")
        sample_rate = sound_file.samplerate

        stft = np.abs(librosa.stft(X))
        result = np.array([])

        mfccs = np.mean(librosa.feature.mfcc(y=X, sr=sample_rate, n_mfcc=47).T, axis=0)
        result = np.hstack((result, mfccs))

        chroma = np.mean(librosa.feature.chroma_stft(S=stft, sr=sample_rate).T, axis=0)
        result = np.hstack((result, chroma))

        mel = np.mean(librosa.feature.melspectrogram(X, sr=sample_rate).T, axis=0)
        result = np.hstack((result, mel))

        spectral_contrast = np.mean(librosa.feature.spectral_contrast(X, sr=sample_rate).T, axis=0)
        result = np.hstack((result, spectral_contrast))

        tonnetz = np.mean(librosa.feature.tonnetz(X, sr=sample_rate).T, axis=0)
        result = np.hstack((result, tonnetz))
        return result


X = []
for i in range(1, 25):

    myDir = 'Audio/Actor_'
    if i < 10:
     myDir += '0'
     myDir += str(i)

    if i >9:
      myDir += str(i)

    print(myDir)
    directory = os.fsencode(myDir)
    for file in os.listdir(directory):
        filename = os.fsdecode(file)
        if filename.endswith(".wav") or filename.endswith(".py"):
            v = extract_feature(myDir+'/'+filename)
            X.append(v)

f.write("# Created by Octave 4.4.1, Sun Mar 22 15:17:52 2020 GMT <unknown@DESKTOP-1KJ1QHE>\n")
f.write("# name: X\n")
f.write("# type: matrix\n")
f.write("# rows: 1440\n")
f.write("# columns: 200\n")
write(X)
f.close()