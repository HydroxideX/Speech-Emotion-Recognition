from tkinter import *
from tkinter import filedialog

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

img1 = PhotoImage(file='img/neutral.gif')
img2 = PhotoImage(file='img/calm.gif')
img3 = PhotoImage(file='img/happy.gif')
img4 = PhotoImage(file='img/sad.gif')
img5 = PhotoImage(file='img/angry.gif')
img6 = PhotoImage(file='img/fearful.gif')
img7 = PhotoImage(file='img/disgust.gif')
img8 = PhotoImage(file='img/surprised.gif')
audioFile = ''
indexOfEmotion = ''
label=Label(root)
label.pack()

def printPrediction():
    global indexOfEmotion
    global label
    if indexOfEmotion == 1:
        label.configure(image=img1)
    elif indexOfEmotion == 2:
        label.configure(image=img2)
    elif indexOfEmotion == 3:
        label.configure(image=img3)
    elif indexOfEmotion == 4:
        label .configure(image=img4)
    elif indexOfEmotion == 5:
        label.configure(image=img5)
    elif indexOfEmotion == 6:
        label.configure(image=img6)
    elif indexOfEmotion == 7:
        label.configure(image=img7)
    elif indexOfEmotion == 8:
        label.configure(image=img8)


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
