<<<<<<< HEAD
<<<<<<< HEAD
from Tkinter import *
from Tkinter import filedialog
=======
from tkinter import *
from tkinter import filedialog
>>>>>>> efcb7aead884cd8be973bf9c28392d0676acdc3d
=======
from tkinter import *
from tkinter import filedialog
>>>>>>> efcb7aead884cd8be973bf9c28392d0676acdc3d

import Predict

# my function can be used as follows: indexOfEmotion = Predict.predictGivenFileName(filename) filename is a string
# with full file location "D//abc//1.wav"   ranges from 1 to 8

root = Tk()
myLabel = Label(root, text="You Think NO One Cares About Your Feelings!", bg="red", fg="white", font=("Helvetica", 16))
myLabel2 = Label(root, text="You Think You Will Die Alone!", fg="#CCCC00", bg="white", font=("Helvetica", 16))
myLabel3 = Label(root, text="We Got You Covered", fg="white", bg="black", font=("Helvetica", 16))
myLabel4 = Label(root, text="Just Talk To US :)", fg="black", bg="green", font=("Helvetica", 16))
myLabel.pack(fill=X)
myLabel2.pack(fill=X)
myLabel3.pack(fill=X)
myLabel4.pack(fill=X)

topFrame = Frame(root)
topFrame.pack()
bottomFrame = Frame(root)
bottomFrame.pack(side=BOTTOM)

audioFile = ''
indexOfEmotion = ''


def printPrediction():
    global indexOfEmotion
    if indexOfEmotion == 1:
        print("Your PH is 7 aka 'NEUTRAL'")
    elif indexOfEmotion == 2:
        print("You are as Calm as a Sloth")
    elif indexOfEmotion == 3:
        print("The Joker is Proud of you")
    elif indexOfEmotion == 4:
        print(":(")
    elif indexOfEmotion == 5:
        print("Take a Chill pill")
    elif indexOfEmotion == 6:
        print("It's Okay, I am here")
    elif indexOfEmotion == 7:
        print("Disgust")
    elif indexOfEmotion == 8:
        print("Boo")


def filebrowser():
    global audioFile
    global indexOfEmotion
    audioFile = filedialog.askopenfilename(initialdir="/", title="Select Your Audio File",
                                           filetypes=(("Audio Files", ".wav "), ("All Files", "*.*")))
    if audioFile:
        indexOfEmotion = Predict.predictGivenFileName(audioFile)
        printPrediction()


browseButton = Button(bottomFrame, text="Browse", fg="red", command=filebrowser)
browseButton.pack(side=LEFT)
#recordButton = Button(bottomFrame, text="Record", fg="blue")
#recordButton.pack(side=LEFT)
exitButton = Button(bottomFrame, text="Exit", fg="black", command=exit)
exitButton.pack(side=LEFT)
root.mainloop()
