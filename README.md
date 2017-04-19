# Pitch-Perfect
Project-1 designed during iOS Developer Nanodegree under INTRO TO IOS APP DEVELOPMENT WITH SWIFT!

The Pitch Perfect app allows users to record a sound using the device’s microphone. It then allows users to play the recorded sound back with six different sound effects / filters. The application uses AVFoundation to record, play and apply sound effects to the recording.

### Record Sounds View

The record sounds view is the initial view for the app, and consists of a button with a microphone image. A label indicates that you should tap the button to start recording is located beneath the image.

Tapping this microphone button starts an AVAudio recording session. The app uses code from AVFoundation to record sounds from the microphone.

Tapping the button disables the record button, display a “recording” indicator label, and presenting a stop button.

When the stop button is clicked, the app completes its recording and then pushes the second scene (described below under “Play Sounds View”) onto the navigation stack. The title in the navigation bar appears as “Record”.


### Play Sounds View
The play sounds view has Six buttons to play the recorded sound file and a button to stop the playback.

* The buttons for playing the recorded sounds have images corresponding to their sound effect:
* Chipmunk image → High-pitched sound
* Darth Vader image → Low-pitched sound
* Snail image → Slow sound
* Rabbit image → Fast sound
* Parrot → Echo
* Overlapping Waveforms → Reverb

The play sounds view is pushed onto the navigation stack. At the top left of the screen, the navigation bar’s left button says “Record”. Clicking this button will pop the play sounds view off the stack and return you to the record sounds view.<br />
At this point, the play sounds view will be in its original state. The microphone button will be enabled and the stop button will be hidden.
 
### Screenshots
<img src = "https://github.com/SahilDhawan/Pitch-Perfect/blob/master/Pitch%20Perfect/Assets.xcassets/ScreenShot-1.imageset/ScreenShot-1.png" width = "25%" height = "25%"><img src = "https://github.com/SahilDhawan/Pitch-Perfect/blob/master/Pitch%20Perfect/Assets.xcassets/ScreenShot-2.imageset/ScreenShot-2.png" width = "25%" height = "25%"><img src = "https://github.com/SahilDhawan/Pitch-Perfect/blob/master/Pitch%20Perfect/Assets.xcassets/ScreenShot-3.imageset/ScreenShot-3.png" width = "25%" height = "25%">
<img src = "https://github.com/SahilDhawan/Pitch-Perfect/blob/master/Pitch%20Perfect/Assets.xcassets/ScreenShot-4.imageset/ScreenShot-4.png" width = "40%" height = "40%">
