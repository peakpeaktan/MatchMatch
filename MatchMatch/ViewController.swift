//
//  ViewController.swift
//  MatchMatch
//
//  Created by zhifeng on 5/23/18.
//  Copyright © 2018 Zhifeng. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    private var level: Level = Level.level1
    
    var pokemonBackgroundMusic: AVAudioPlayer?
    var boomSoundEffect: AVAudioPlayer?
    
    @IBOutlet var containerView: UIImageView!
    
    @IBOutlet var collection: [UIImageView]!
    
    private lazy var animator = UIDynamicAnimator(referenceView: containerView)
    private lazy var behavior = LetterObjectViewBehavior(in: animator)
    
    @IBAction func boom(_ sender: UIButton) {
        
        let path = Bundle.main.path(forResource: "boom.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            boomSoundEffect = try AVAudioPlayer(contentsOf: url)
            boomSoundEffect?.play()
        } catch {
            
        }
        
        for each in collection {
            
            behavior.addItem(each)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for each in collection {
            each.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped(_:))))
            behavior.addItem(each)
        }
        
        let path = Bundle.main.path(forResource: "pokemonmusic.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            pokemonBackgroundMusic = try AVAudioPlayer(contentsOf: url)
            pokemonBackgroundMusic?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
//    private var lastChoosenView: UIImageView?
    
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            if let chosenView = sender.view as? UIImageView{
//                lastChoosenView = chosenView
                behavior.removeItem(chosenView)
                chosenView.enlargeAnimation {
                    
                }
            }
            
        default: break
        }
    }

//    func randomString(length: Int) -> String {
//        let alphabet = "abcdefghijklmnopqrstuvwxyz"
//        let allowedCharsCount = UInt32(allowedChars.characters.count)
//        var randomString = ""
//
//        for _ in 0..<length {
//            let randomNum = Int(arc4random_uniform(allowedCharsCount))
//            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
//            let newCharacter = allowedChars[randomIndex]
//            randomString += String(newCharacter)
//        }
//
//        return randomString
//    }

}

