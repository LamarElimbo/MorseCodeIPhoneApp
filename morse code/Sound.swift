//
//  Sound.swift
//  morse code
//
//  Created by Preferred Customer on 2016-04-14.
//  Copyright © 2016 Lawinjo. All rights reserved.
//

import UIKit
import AVFoundation

struct Sound {
    
    var queuePlayer = AVQueuePlayer()
    var playerItem: AVPlayerItem?
    
    mutating func fastDotAction() {
        print("dot action works")
        let fastDotPath = NSBundle.mainBundle().pathForResource("fastDot500", ofType: "mp3")!
        let fastDotUrl = NSURL(fileURLWithPath: fastDotPath)
        playerItem = AVPlayerItem(URL: fastDotUrl)
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    mutating func fastDashAction() {
        let fastDashPath = NSBundle.mainBundle().pathForResource("fastDash500", ofType: "mp3")!
        let fastDashUrl = NSURL(fileURLWithPath: fastDashPath)
        playerItem = AVPlayerItem(URL: fastDashUrl)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    mutating func fastPauseAction() {
        let fastPause1Path = NSBundle.mainBundle().pathForResource("fastPause1", ofType: "mp3")!
        let fastPause1Url = NSURL(fileURLWithPath: fastPause1Path)
        playerItem = AVPlayerItem(URL: fastPause1Url)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    mutating func fasterDotAction() {
        let fasterDotPath = NSBundle.mainBundle().pathForResource("fasterDot500", ofType: "mp3")!
        let fasterDotUrl = NSURL(fileURLWithPath: fasterDotPath)
        playerItem = AVPlayerItem(URL: fasterDotUrl)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    mutating func fasterDashAction() {
        let fasterDashPath = NSBundle.mainBundle().pathForResource("fasterDash500", ofType: "mp3")!
        let fasterDashUrl = NSURL(fileURLWithPath: fasterDashPath)
        playerItem = AVPlayerItem(URL: fasterDashUrl)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    mutating func fasterPauseAction() {
        let fasterPause1Path = NSBundle.mainBundle().pathForResource("fasterPause1", ofType: "mp3")!
        let fasterPause1Url = NSURL(fileURLWithPath: fasterPause1Path)
        playerItem = AVPlayerItem(URL: fasterPause1Url)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    mutating func fastestDotAction() {
        let fastestDotPath = NSBundle.mainBundle().pathForResource("fastestDot500", ofType: "mp3")!
        let fastestDotUrl = NSURL(fileURLWithPath: fastestDotPath)
        playerItem = AVPlayerItem(URL: fastestDotUrl)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    mutating func fastestDashAction() {
        let fastestDashPath = NSBundle.mainBundle().pathForResource("fastestDash500", ofType: "mp3")!
        let fastestDashUrl = NSURL(fileURLWithPath: fastestDashPath)
        playerItem = AVPlayerItem(URL: fastestDashUrl)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    mutating func fastestPauseAction() {
        let fastestPause1Path = NSBundle.mainBundle().pathForResource("fastestPause1", ofType: "mp3")!
        let fastestPause1Url = NSURL(fileURLWithPath: fastestPause1Path)
        playerItem = AVPlayerItem(URL: fastestPause1Url)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }

    
}
