//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Sahil Dhawan on 15/02/17.
//  Copyright © 2017 Sahil Dhawan. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController{
    
    var audioRecorder : AVAudioRecorder!
    
    //MARK: Outlets
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.stopRecordingButton.isEnabled = false
    }
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording"
        {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    @IBAction func recordAudio(_ sender: Any) {
        enable(record: false, stop: true, label: "Recording!")
        
        //referring to the document directory
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,  .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath,recordingName]
        let filePath = URL(string: pathArray.joined(separator:"/"))
        
        //Creating a sharedInstance of the AVAudioSession
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.delegate  = self
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    @IBAction func stopRecording(_ sender: Any) {
        enable(record: true, stop: false, label: "Tap to Record!")
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)

    }
    func enable(record:Bool,stop:Bool,label:String)
    {
        self.recordButton.isEnabled = record
        self.stopRecordingButton.isEnabled = stop
        self.recordingLabel.text = label
    }
}
//MARK- AVAudioRecorder
extension RecordSoundsViewController: AVAudioRecorderDelegate
{
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag
        {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }else
        {
            print("Recording not successfull")
        }
    }

}
