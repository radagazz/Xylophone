//
//  ViewController.swift
//  Xylophone
//
//  Created by anurak teerarattananukulchai on 9/11/2563 BE.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        
    }
    
    
    func playSound(soundName : String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

