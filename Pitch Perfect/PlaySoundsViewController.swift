//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Sahil Dhawan on 16/02/17.
//  Copyright © 2017 Sahil Dhawan. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var darthVaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var stackView1: UIStackView!
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var stackView3: UIStackView!
    @IBOutlet weak var outerStackView: UIStackView!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender:UIButton)
    {
        switch(ButtonType(rawValue: sender.tag)!)
        {
        case .slow:
                playSound(rate:0.5)
        case .fast:
                playSound(rate:1.5)
        case .chipmunk:
            playSound(pitch:1000)
        case .vader:
            playSound(pitch:-1000)
        case  .echo:
            playSound(echo:true)
        case .reverb:
            playSound(reverb:true)
        }
        configureUI(.playing)
    }
    @IBAction func stopButtonPressed(_ sender:UIButton)
    {
        stopAudio()
    }
    
    
    var recordedAudioURL : URL!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //changed the content mode to Aspect Fit
        snailButton.imageView?.contentMode = .scaleAspectFit
        rabbitButton.imageView?.contentMode = .scaleAspectFit
        chipmunkButton.imageView?.contentMode = .scaleAspectFit
        darthVaderButton.imageView?.contentMode = .scaleAspectFit
        echoButton.imageView?.contentMode = .scaleAspectFit
        reverbButton.imageView?.contentMode = .scaleAspectFit
        
        setupAudio()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let orientation = UIApplication.shared.statusBarOrientation
        if orientation == .portrait || orientation == .portraitUpsideDown
        {
            changeAxis(axis: .vertical)
            self.outerStackView.axis = .horizontal
        }
        else
        {
            changeAxis(axis: .horizontal)
            self.outerStackView.axis = .vertical


        }
    }
    func changeAxis(axis:UILayoutConstraintAxis)
    {
        self.stackView1.axis = axis
        self.stackView2.axis = axis
        self.stackView3.axis = axis

    }
}
