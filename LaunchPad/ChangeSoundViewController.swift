//
//  ChangeSoundViewController.swift
//  LaunchPad
//
//  Created by Ash Tan on 2017-03-20.
//  Copyright © 2017 UBCCPEN291G8. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import ESTMusicIndicator
import SwiftVideoBackground


//instance of a sound player


class ChangeSoundViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    var soundPlayer = AVAudioPlayer()
    var positionOfSong = Int()
    var songIndex = String()
    var musicPlayingIcon = ESTMusicIndicatorView()
    var backgroundVideoSent = BackgroundVideo()

    
    var songTitles = ["Silence","Luigi","PowerChant 1","PowerChant 2","PowerChant 3","Snap 1","Snap 2","Snap 3","Cymbol 1","Click 1","Bass 1","Bass 2","Bass 3","Snare 1","Deep Bass 1","CLick 2","Ding 1","Ding 1","Snare 2","Snare 3","Electro 1","Snare 4","Deep Bass 2"]
    
    
    var listOfSongsToPlayHere = [String]()

    
    @IBOutlet weak var soundsTableView: UITableView!
    

    @IBAction func soundButtonPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            
            do {
                let url =  Bundle.main.url(forResource: listOfSongsToPlayHere[0], withExtension: "mp4")
                soundPlayer = try AVAudioPlayer(contentsOf:url!)
                soundPlayer.prepareToPlay()
                soundPlayer.play()
                soundPlayer.numberOfLoops = 0
                
            } catch let error as NSError {
                print(error)
            }

        }
        if sender.tag == 1 {
            
            do {
                let url =  Bundle.main.url(forResource: listOfSongsToPlayHere[1], withExtension: "mp4")
                soundPlayer = try AVAudioPlayer(contentsOf:url!)
                soundPlayer.prepareToPlay()
                soundPlayer.play()
                soundPlayer.numberOfLoops = 0
                
            } catch let error as NSError {
                print(error)
            }
        }
        if sender.tag == 2 {
            
            do {
                let url =  Bundle.main.url(forResource: listOfSongsToPlayHere[2], withExtension: "mp4")
                soundPlayer = try AVAudioPlayer(contentsOf:url!)
                soundPlayer.prepareToPlay()
                soundPlayer.play()
                soundPlayer.numberOfLoops = 0
                
            } catch let error as NSError {
                print(error)
            }
        }
        if sender.tag == 3 {
            
        }
        if sender.tag == 4 {
            
        }
        if sender.tag == 5 {
            
        }
        if sender.tag == 6 {
            
        }
        if sender.tag == 7 {
            
        }
        if sender.tag == 8 {
            
        }
        if sender.tag == 9 {
            
        }
        if sender.tag == 0 {
            
        }
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return songTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SoundCells = (tableView.dequeueReusableCell(withIdentifier: "SoundCell") as? SoundCells)!
        
        cell.soundLabel.text = songTitles[indexPath.row]
        
        cell.soundImage.tag = indexPath.row
        cell.soundImage.layer.cornerRadius = 30
        
        musicPlayingIcon = ESTMusicIndicatorView.init(frame: CGRect.zero)
        musicPlayingIcon.tintColor = UIColor(red: 45.0/255, green: 251.0/255, blue: 255.0/255, alpha: 1.0)
        musicPlayingIcon.sizeToFit()
        cell.soundImage.addSubview(musicPlayingIcon)
        musicPlayingIcon.state = .playing
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        songIndex = "\(indexPath.row)"
        backgroundVideoSent.player?.pause()
        backgroundVideoSent.player?.replaceCurrentItem(with: nil)
        performSegue(withIdentifier: "fromMainLaunchPadBackToChangeSound", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromMainLaunchPadBackToChangeSound"  {
            let mainController = segue.destination as? MainLaunchpadViewController
            mainController?.songForButton[positionOfSong] = songIndex
            mainController?.segueLimiter = 0
        }
    }
    



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
     
        if (navigationController?.viewControllers.count)! >= 2 {
            
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        print(positionOfSong)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationImage = UIImage(named: "takeofflogo4")
        navigationItem.titleView = UIImageView(image: navigationImage)
        
        soundsTableView.delegate = self
        soundsTableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
    }
    
    
    
    
    
}

