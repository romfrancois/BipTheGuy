//
//  ViewController.swift
//  BipTheGuy
//
//  Created by Romain Francois on 29/06/2020.
//  Copyright © 2020 Romain Francois. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print(" ERROR: \(error.localizedDescription)")
            }
        } else {
            print("ERROR: Could not read data from file \(name)")
        }
    }

    @IBAction func punchButtonPressed(_ sender: UIButton) {
        let originalImageFrame = imageView.frame
        let imageWidthShrink: CGFloat = 20
        let imageHeightShrink: CGFloat = 20
        let smallerImageFrame = CGRect(
            x: imageView.frame.origin.x + imageWidthShrink,
            y: imageView.frame.origin.y + imageHeightShrink,
            width: imageView.frame.width - (2 * imageWidthShrink),
            height: imageView.frame.height - (2 * imageHeightShrink))
        
        imageView.frame = smallerImageFrame
        
        playSound(name: "punchSound")
        
        UIView.animate(
            withDuration: 0.25,
            delay: 0.0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 10.0,
            options: [],
            animations: {
                self.imageView.frame = originalImageFrame
        })
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let originalImageFrame = imageView.frame
        let imageWidthShrink: CGFloat = 20
        let imageHeightShrink: CGFloat = 20
        let smallerImageFrame = CGRect(
            x: imageView.frame.origin.x + imageWidthShrink,
            y: imageView.frame.origin.y + imageHeightShrink,
            width: imageView.frame.width - (2 * imageWidthShrink),
            height: imageView.frame.height - (2 * imageHeightShrink))
        
        imageView.frame = smallerImageFrame
        
        playSound(name: "punchSound")
        
        UIView.animate(
            withDuration: 0.25,
            delay: 0.0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 10.0,
            options: [],
            animations: {
                self.imageView.frame = originalImageFrame
        })
    }
}
