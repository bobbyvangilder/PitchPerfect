//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Bobby VanGilder on 9/7/17.
//  Copyright © 2017 Bobby VanGilder. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func playSoundForButton(_ sender: UIButton){
        switch(ButtonType(rawValue: sender.tag)!){
        case .slow:
            playSound(rate: 0.5)
            print("\(ButtonType.slow) button has been pressed")
        case .fast:
            playSound(rate: 1.5)
            print("\(ButtonType.fast) button has been pressed")
        case .chipmunk:
            playSound(pitch: 1000)
            print("\(ButtonType.chipmunk) button has been pressed")
        case .vader:
            playSound(pitch: -1000)
            print("\(ButtonType.vader) button has been pressed")
        case .echo:
            playSound(echo: true)
            print("\(ButtonType.echo) button has been pressed")
        case .reverb:
            playSound(reverb: true)
            print("\(ButtonType.reverb) button has been pressed")
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton){
        print("Stop Button has been pressed.")
        stopAudio()
    }
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAspect()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    func setAspect() {
        let arrayOfButtons = [slowButton,fastButton,highPitchButton,lowPitchButton,echoButton,reverbButton]
        
        for button in arrayOfButtons {
            if let button = button {
                button.imageView?.contentMode = .scaleAspectFit
            }
        }
    }

}
