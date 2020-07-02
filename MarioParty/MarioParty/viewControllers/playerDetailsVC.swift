//
//  playerDetailsVC.swift
//  MarioParty
//
//  Created by Huda on 7/2/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation

class playerDetailsVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var starsImageView: UIImageView!
    @IBOutlet weak var bgImageView: UIImageView!
    var playerSoundEffect: AVAudioPlayer?
    var fiveStarsSoundEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedPlayer.name
        characterImageView.loadGif(name: selectedPlayer.name)
        bgImageView.image = UIImage(named: selectedPlayer.bgName())
        // Do any additional setup after loading the view.
    }
    
    @IBAction func randomizeStars(_ sender: Any) {
        var stars = ["Star1", "Star2", "Star3", "Star4", "Star5"]
        let randomStar = stars.randomElement()
        starsImageView.image = UIImage(named: randomStar!)
        if randomStar == "Star5" {
            playCelebrationSound(musicName: "celebration.mp3")
        }
        
    }
    
    @IBAction func playCharacterMusic(_ sender: Any) {
        playMusic(musicName: selectedPlayer.musicName())
    }
    
    func playMusic(musicName: String) {
           let path = Bundle.main.path(forResource: musicName, ofType:nil)!
           let url = URL(fileURLWithPath: path)

           do {
               playerSoundEffect = try AVAudioPlayer(contentsOf: url)
               playerSoundEffect?.play()
           } catch {
               // couldn't load file :(
           }
       }
    
    func playCelebrationSound(musicName: String) {
        
               let path = Bundle.main.path(forResource: musicName, ofType:nil)!
               let url = URL(fileURLWithPath: path)

               do {
                   fiveStarsSoundEffect = try AVAudioPlayer(contentsOf: url)
                   fiveStarsSoundEffect?.play()
               } catch {
                   // couldn't load file :(
               }
    }
           
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


