//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

//  inherit from AVAudioPlayerDelegate so we can use the AVAudioPlayer
class ViewController: UIViewController, AVAudioPlayerDelegate {
//  create istance variable, of type AVAudioPlayer
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
//      each button has it's own tag since they all point to the same action
//      we are passing that tag (an integer) to the playSound function
        playSound(noteNumber: sender.tag)
    }
    
    func playSound(noteNumber: Int) {
//      go into the Sound Files and find each file, based on the Int passed in
        let soundUrl = Bundle.main.url(forResource: "note\(noteNumber)", withExtension: "wav")
        
        do {
//          the equivalent of opening spotify and tapping "play"
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
        }
//      if the do doesn't work, tell us why
        catch {
            print(error)
        }
//      play is a built in function from the AVAudioPlayer class
        audioPlayer.play()
    }

}





