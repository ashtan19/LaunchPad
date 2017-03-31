//
//  SoundCells.swift
//  LaunchPad
//
//  Created by Ash Tan on 2017-03-20.
//  Copyright © 2017 UBCCPEN291G8. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class SoundCells : UITableViewCell {
    
    let path = Bundle.main.path(forResource: "1.mp3", ofType: nil)
    
    var sound : String!
    
    var soundPlayer = AVAudioPlayer()
    
    @IBOutlet weak var soundImage: UIButton!
    
    
    
    @IBOutlet weak var soundLabel: UILabel!
    
    
    
}
