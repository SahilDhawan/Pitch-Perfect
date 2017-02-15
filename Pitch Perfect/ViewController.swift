//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Sahil Dhawan on 15/02/17.
//  Copyright © 2017 Sahil Dhawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.stopRecordingButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        self.stopRecordingButton.isEnabled = true
        self.recordButton.isEnabled = false
        self.recordingLabel.text = "Recording in Progress"
    }
    @IBAction func stopRecording(_ sender: Any) {
        self.recordButton.isEnabled = true
        self.stopRecordingButton.isEnabled = false
        self.recordingLabel.text = "Tap to Record"

        
    }

}

