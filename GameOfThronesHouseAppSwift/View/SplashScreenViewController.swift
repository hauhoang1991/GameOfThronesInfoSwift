//
//  SplashScreenViewController.swift
//  GameOfThronesHouseAppSwift
//
//  Created by Hau Hoang on 2023-08-11.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        if audioPlayer != nil {
            audioPlayer.stop()
        }
                
        performSegue(withIdentifier: "ShowTableView", sender: nil)
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("Error: \(error.localizedDescription). Could not initializer AVAudioPlayer object")
            }
        } else {
            print("Error: Could not read data from file \(name)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(name: "GoT_theme")
    }
}
