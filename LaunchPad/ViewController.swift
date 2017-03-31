//
//  ViewController.swift
//  LaunchPad
//
//  Created by Ash Tan on 2017-03-20.
//  Copyright © 2017 UBCCPEN291G8. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation
import AudioToolbox
import AVKit
import SwiftVideoBackground
import MediaPlayer
import Alamofire

class MainLaunchpadViewController: UIViewController ,AVAudioPlayerDelegate {

    var backgroundVideo = BackgroundVideo()
    
    //Variable Declarations
    var songList = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]
    
    var songForButton = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    
    var songURL = [URL]()
    var soundPlayer1 = AVAudioPlayer()
    var soundPlayer2 = AVAudioPlayer()
    var soundPlayer3 = AVAudioPlayer()
    var soundPlayer4 = AVAudioPlayer()
    var soundPlayer5 = AVAudioPlayer()
    var soundPlayer6 = AVAudioPlayer()
    var soundPlayer7 = AVAudioPlayer()
    var soundPlayer8 = AVAudioPlayer()
    var soundPlayer9 = AVAudioPlayer()
    var soundPlayer10 = AVAudioPlayer()
    var soundPlayer11 = AVAudioPlayer()
    var soundPlayer12 = AVAudioPlayer()
    var soundPlayer13 = AVAudioPlayer()
    var soundPlayer14 = AVAudioPlayer()
    var soundPlayer15 = AVAudioPlayer()
    var soundPlayer16 = AVAudioPlayer()
    var allSoundPlayers = [AVAudioPlayer]()
    var positionOfSongToSend = Int()
    var segueLimiter = 0
    var songDurations = [Double]()

    @IBOutlet weak var songSwitch: UISwitch!
    @IBAction func songSwitchPressed(_ sender: AnyObject) {
        if songSwitch.isOn {
            backgroundVideo.unMuteSong()
        }
            if songSwitch.isOn == false {
                backgroundVideo.muteSong()

            }
    }
        
    @IBOutlet weak var songSlider: UISlider!
    @IBAction func songSliderChanged(_ sender: Any) {
        let selectedValue = songSlider.value
        (MPVolumeView().subviews.filter{NSStringFromClass($0.classForCoder) == "MPVolumeSlider"}.first as? UISlider)?.setValue(selectedValue, animated: false)

    }

    

    @IBOutlet weak var playSetSegmentControl: UISegmentedControl!
    
    //Play Song Function
    func playSong(whichSoundPlayer: Int, positionOfButton:Int , numberOfLoops : Int) {
        do {
            let url =  Bundle.main.url(forResource: songForButton[positionOfButton], withExtension: "mp4")
            allSoundPlayers[whichSoundPlayer] = try AVAudioPlayer(contentsOf:url!)
            allSoundPlayers[whichSoundPlayer].prepareToPlay()
            allSoundPlayers[whichSoundPlayer].play()
            allSoundPlayers[whichSoundPlayer].numberOfLoops = numberOfLoops
            
        } catch let error as NSError {
            print(error)
        }
    }
    
    
    @IBOutlet weak var btn1: UIButton!
    @IBAction func btn1Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 0, positionOfButton: 0, numberOfLoops: 0)
            
            if allSoundPlayers[0].isPlaying {
            }
            
        } else {
            positionOfSongToSend = btn1.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    @IBAction func btn1Hold(_ sender: UILongPressGestureRecognizer) {
        
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 0, positionOfButton: 0, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[0].stop()
            }
            
            
        } else {
            
            positionOfSongToSend = btn1.tag
            segueLimiter += 1
            
            if segueLimiter == 1 {
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            }
        }
    }
    
    
    
    @IBOutlet weak var btn2: UIButton!
    @IBAction func btn2Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 1, positionOfButton: 1, numberOfLoops: 0)
        }   else {
            positionOfSongToSend = btn2.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            
        }
        
    }
    
    @IBAction func btn2Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 1, positionOfButton: 1, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[1].stop()
            }  else {
                positionOfSongToSend = btn2.tag
                segueLimiter += 1
                
                if segueLimiter == 1 {
                performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
                }
            }
        }
    }
    
    
    @IBOutlet weak var btn3: UIButton!
    @IBAction func btn3Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 2, positionOfButton: 2, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn3.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    @IBAction func btn3Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 2, positionOfButton: 2, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[2].stop()
            } else {
                positionOfSongToSend = btn3.tag
                segueLimiter += 1
                
                if segueLimiter == 1 {
                performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
                }
            }
        }
    }
    
    
    
    @IBOutlet weak var btn4: UIButton!
    @IBAction func btn4Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 3, positionOfButton: 3, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn4.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    
    @IBAction func btn4Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 3, positionOfButton: 3, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[3].stop()
            }
            else {
                positionOfSongToSend = btn4.tag
                segueLimiter += 1
                
                if segueLimiter == 1 {
                performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
                }
            }
        }
        
    }
    
    
    @IBOutlet weak var btn5: UIButton!
    @IBAction func btn5Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 4, positionOfButton: 4, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn5.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    @IBAction func btn5Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 4, positionOfButton: 4, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[4].stop()
            }
            else {
                positionOfSongToSend = btn5.tag
                segueLimiter += 1
                
                if segueLimiter == 1 {
                performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
                }
            }
        }
    }
    
    @IBOutlet weak var btn6: UIButton!
    @IBAction func btn6Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 5, positionOfButton: 5, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn6.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    @IBAction func btn6Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 5, positionOfButton: 5, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[5].stop()
            }
        }else {
            positionOfSongToSend = btn6.tag
            segueLimiter += 1
            
            if segueLimiter == 1 {
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            }
        }
        
    }
    
    
    @IBOutlet weak var btn7: UIButton!
    @IBAction func btn7Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            
            self.playSong(whichSoundPlayer: 6, positionOfButton: 6, numberOfLoops: 0)
            
            
        } else {
            positionOfSongToSend = btn7.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    @IBAction func btn7Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 6, positionOfButton: 6, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[6].stop()
            }
        }else {
            positionOfSongToSend = btn7.tag
            segueLimiter += 1
            
            if segueLimiter == 1 {
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            }
        }
        
    }
    
    
    
    
    @IBOutlet weak var btn8: UIButton!
    @IBAction func btn8Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 7, positionOfButton: 7, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn8.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    @IBAction func btn8Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 7, positionOfButton: 7, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[7].stop()
            }
        }else {
            positionOfSongToSend = btn8.tag
            segueLimiter += 1
            
            if segueLimiter == 1 {
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            }
        }
        
        
    }
    
    
    @IBOutlet weak var btn9: UIButton!
    @IBAction func btn9Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 8, positionOfButton: 8, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn9.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    @IBAction func btn9Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 8, positionOfButton: 8, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[8].stop()
            }
        }else {
            positionOfSongToSend = btn9.tag
            segueLimiter += 1
            
            if segueLimiter == 1 {
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            }
        }
        
        
    }
    
    @IBOutlet weak var btn10: UIButton!
    @IBAction func btn10Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 9, positionOfButton: 9, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn10.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    @IBAction func btn10Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 9, positionOfButton: 9, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[9].stop()
            }
        } else {
            positionOfSongToSend = btn10.tag
            segueLimiter += 1
            
            if segueLimiter == 1 {
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            }
        }
        
    }
    
    @IBOutlet weak var btn11: UIButton!
    @IBAction func btn11Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 10, positionOfButton: 10, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn11.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    @IBAction func btn11Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 10, positionOfButton: 10, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[10].stop()
            }
        } else {
            positionOfSongToSend = btn11.tag
            segueLimiter += 1
            
            if segueLimiter == 1 {
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            }
        }
        
    }
    
    @IBOutlet weak var btn12: UIButton!
    @IBAction func btn12Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 11, positionOfButton: 11, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn12.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    @IBAction func btn12Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 11, positionOfButton: 11, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[11].stop()
            }
        } else {
            positionOfSongToSend = btn12.tag
            segueLimiter += 1
            
            if segueLimiter == 1 {
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            }
        }
        
    }
    
    
    @IBOutlet weak var btn13: UIButton!
    @IBAction func btn13Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 12, positionOfButton: 12, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn13.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    @IBAction func btn13Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 12, positionOfButton: 12, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[12].stop()
            }
        } else {
            positionOfSongToSend = btn13.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    
    @IBOutlet weak var btn14: UIButton!
    @IBAction func btn14Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 13, positionOfButton: 13, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn14.tag
            segueLimiter += 1
            
            if segueLimiter == 1 {
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            }
        }
        
    }
    
    @IBAction func btn14Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 13, positionOfButton: 13, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[13].stop()
            }
        } else {
            positionOfSongToSend = btn14.tag
            segueLimiter += 1
            
            if segueLimiter == 1 {
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            }
        }
        
    }
    
    
    @IBOutlet weak var btn15: UIButton!
    @IBAction func btn15Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 14, positionOfButton: 14, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn15.tag
            
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    @IBAction func btn15Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 14, positionOfButton: 14, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[14].stop()
            }
        } else {
            positionOfSongToSend = btn15.tag
            segueLimiter += 1
            
            if segueLimiter == 1 {
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            }
        }
        
    }
    @IBOutlet weak var btn16: UIButton!
    @IBAction func btn16Tap(_ sender: UITapGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            self.playSong(whichSoundPlayer: 15, positionOfButton: 15, numberOfLoops: 0)
        } else {
            positionOfSongToSend = btn16.tag
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
        }
        
    }
    
    @IBAction func btn16Hold(_ sender: UILongPressGestureRecognizer) {
        if playSetSegmentControl.selectedSegmentIndex == 0 {
            
            sender.minimumPressDuration = 0.1
            if sender.state == .began {
                self.playSong(whichSoundPlayer: 15, positionOfButton: 15, numberOfLoops: -1)
                
            } else if sender.state == .ended {
                allSoundPlayers[15].stop()
            }
        } else {
            positionOfSongToSend = btn16.tag
            segueLimiter += 1
            
            if segueLimiter == 1 {
            performSegue(withIdentifier: "fromMainLaunchPadToChangeSound", sender: nil)
            }
        }
        
    }
    
    
    
    @IBOutlet weak var uploadBtn: UIButton!
    @IBAction func uploadBtnPressed(_ sender: Any) {
        
//        var parameter :[String:Any] = [songForButton.joined(separator: ","):songForButton.joined(separator: ",")]
//        
//            Alamofire.request("http://38.88.74.83/cpen291-project2/dataTest.txt", method: .post, parameters: parameter, encoding: JSONEncoding.default).responseJSON { (response:DataResponse<Any>) in
//                
//                switch(response.result) {
//                    
//                case .success(_):
//                    
//                    if response.result.value != nil{
//                        
//                    break
//                        
//                    print(response.result.error!)
//                    
//                    break
//                    
//                
//                    
//                    }
//                
//                default: print("FUK")
//                }
//            }
//                
                }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromMainLaunchPadToChangeSound"  {
            let changeSoundController = segue.destination as? ChangeSoundViewController
            changeSoundController?.positionOfSong = positionOfSongToSend
            changeSoundController?.listOfSongsToPlayHere = songList
            changeSoundController?.backgroundVideoSent = self.backgroundVideo
        }
    }
    
    
    func duration(for resource: String) -> Double {
        let asset = AVURLAsset(url: URL(fileURLWithPath: resource))
        return Double(CMTimeGetSeconds(asset.duration))
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        self.navigationItem.setHidesBackButton(true, animated: false)
        
        for songNames in songList {
           var duration = self.duration(for: songNames)
            songDurations.append(duration)
            print(songDurations)
        }
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
      

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let navigationImage = UIImage(named: "takeofflogo4")
        navigationItem.titleView = UIImageView(image: navigationImage)
        
        self.allSoundPlayers = [self.soundPlayer1,self.soundPlayer2,self.soundPlayer3,self.soundPlayer4,self.soundPlayer5,self.soundPlayer6,self.soundPlayer7,self.soundPlayer8,self.soundPlayer9,self.soundPlayer10,self.soundPlayer11,self.soundPlayer12,self.soundPlayer13,self.soundPlayer14,self.soundPlayer15,self.soundPlayer16]
    
        backgroundVideo.frame = self.view.frame
        self.view.addSubview(backgroundVideo)
        self.view.sendSubview(toBack: backgroundVideo)
        backgroundVideo.createBackgroundVideo(name: "BackGroundVid", type: "mp4", alpha: 0)
        
        uploadBtn.layer.borderWidth = 1.0
        uploadBtn.layer.borderColor = UIColor(red: 45.0/255, green: 251.0/255, blue: 255.0/255, alpha: 1.0).cgColor
        uploadBtn.layer.cornerRadius = 7.0
        
        self.playSetSegmentControl.layer.cornerRadius = 7
        self.playSetSegmentControl.layer.masksToBounds = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        
    }
    
    
    
    
    
}

