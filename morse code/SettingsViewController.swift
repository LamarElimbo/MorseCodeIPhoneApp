//
//  SettingsViewController.swift
//  morse code
//
//  Created by Preferred Customer on 2016-04-13.
//  Copyright © 2016 Lawinjo. All rights reserved.
//

import UIKit
import AVFoundation

class SettingsViewController: UIViewController {
    
    var speed:SpeedChoice?

    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var fasterButton: UIButton!
    @IBOutlet weak var fastestButton: UIButton!
    
    @IBOutlet weak var fastTestButton: UIButton!
    @IBOutlet weak var fasterTestButton: UIButton!
    @IBOutlet weak var fastestTestButton: UIButton!
    
    var testWord = "- ● ●●● -"
    
    @IBAction func speedChoice(sender: AnyObject) {
        
        switch (sender as! UIButton) {
            
        case fastButton:
            speed = .Fast
            fastSelected()
        case fasterButton:
            speed = .Faster
            fasterSelected()
        case fastestButton:
            speed = .Fastest
            fastestSelected()
        default:
            print("not a valid option")
            
        }
        
    }
    
    // MARK: Sound Functionality
/*
    var queuePlayer = AVQueuePlayer()
    var playerItem: AVPlayerItem?
    
    func fastDotAction() {
        let fastDotPath = NSBundle.mainBundle().pathForResource("fastDot500", ofType: "mp3")!
        let fastDotUrl = NSURL(fileURLWithPath: fastDotPath)
        playerItem = AVPlayerItem(URL: fastDotUrl)
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    func fastDashAction() {
        let fastDashPath = NSBundle.mainBundle().pathForResource("fastDash500", ofType: "mp3")!
        let fastDashUrl = NSURL(fileURLWithPath: fastDashPath)
        playerItem = AVPlayerItem(URL: fastDashUrl)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    func fastPauseAction() {
        let fastPause1Path = NSBundle.mainBundle().pathForResource("fastPause1", ofType: "mp3")!
        let fastPause1Url = NSURL(fileURLWithPath: fastPause1Path)
        playerItem = AVPlayerItem(URL: fastPause1Url)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
*/
    
    var fastDot = Sound()
    var fastDash = Sound()
    var fastPause = Sound()
    var qPlayer = Sound().queuePlayer
    var playerItem = Sound().playerItem
    //var queueEssentials = Sound(queuePlayer: qPlayer, playerItem: playerItem)
    var queue = Sound().queuePlayer
    
    func fastTestLoop() {
        
        var characterConversion = [Character](testWord.characters)
        var i = 0
        
        for i = 0; i < characterConversion.count; i++ {
            
            switch characterConversion[i] {
            case "●": fastDot.fastDotAction()
            case "-": fastDash.fastDashAction()
            case " ": fastPause.fastPauseAction()
            default:
                print("fastTestLoop did not work")
            }
            
        }
        
    }
/*
    func fasterDotAction() {
        let fasterDotPath = NSBundle.mainBundle().pathForResource("fasterDot500", ofType: "mp3")!
        let fasterDotUrl = NSURL(fileURLWithPath: fasterDotPath)
        playerItem = AVPlayerItem(URL: fasterDotUrl)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    func fasterDashAction() {
        let fasterDashPath = NSBundle.mainBundle().pathForResource("fasterDash500", ofType: "mp3")!
        let fasterDashUrl = NSURL(fileURLWithPath: fasterDashPath)
        playerItem = AVPlayerItem(URL: fasterDashUrl)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    func fasterPauseAction() {
        let fasterPause1Path = NSBundle.mainBundle().pathForResource("fasterPause1", ofType: "mp3")!
        let fasterPause1Url = NSURL(fileURLWithPath: fasterPause1Path)
        playerItem = AVPlayerItem(URL: fasterPause1Url)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    func fasterTestLoop() {
        
        var characterConversion = [Character](testWord.characters)
        var i = 0
        
        for i = 0; i < characterConversion.count; i++ {
            
            switch characterConversion[i] {
            case "●": fasterDotAction()
            case "-": fasterDashAction()
            case " ": fasterPauseAction()
            default:
                print("fasterTestLoop did not work")
            }
            
        }
        
    }
    
    func fastestDotAction() {
        let fastestDotPath = NSBundle.mainBundle().pathForResource("fastestDot500", ofType: "mp3")!
        let fastestDotUrl = NSURL(fileURLWithPath: fastestDotPath)
        playerItem = AVPlayerItem(URL: fastestDotUrl)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    func fastestDashAction() {
        let fastestDashPath = NSBundle.mainBundle().pathForResource("fastestDash500", ofType: "mp3")!
        let fastestDashUrl = NSURL(fileURLWithPath: fastestDashPath)
        playerItem = AVPlayerItem(URL: fastestDashUrl)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    func fastestPauseAction() {
        let fastestPause1Path = NSBundle.mainBundle().pathForResource("fastestPause1", ofType: "mp3")!
        let fastestPause1Url = NSURL(fileURLWithPath: fastestPause1Path)
        playerItem = AVPlayerItem(URL: fastestPause1Url)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    func fastestTestLoop() {
        
        var characterConversion = [Character](testWord.characters)
        var i = 0
        
        for i = 0; i < characterConversion.count; i++ {
            
            switch characterConversion[i] {
            case "●": fastestDotAction()
            case "-": fastestDashAction()
            case " ": fastestPauseAction()
            default:
                print("fastestTestLoop did not work")
            }
            
        }
        
    }
*/
    func fastSelected() {
        fastButton.layer.borderColor = UIColor.blueColor().CGColor
        fastButton.layer.borderWidth = 4
        fastButton.layer.cornerRadius = 5
        
        fasterButton.layer.borderColor = UIColor.redColor().CGColor
        fasterButton.layer.borderWidth = 4
        fasterButton.layer.cornerRadius = 5
        
        fastestButton.layer.borderColor = UIColor.redColor().CGColor
        fastestButton.layer.borderWidth = 4
        fastestButton.layer.cornerRadius = 5
    }
    
    func fasterSelected() {
        fastButton.layer.borderColor = UIColor.redColor().CGColor
        fastButton.layer.borderWidth = 4
        fastButton.layer.cornerRadius = 5
        
        fasterButton.layer.borderColor = UIColor.blueColor().CGColor
        fasterButton.layer.borderWidth = 4
        fasterButton.layer.cornerRadius = 5
        
        fastestButton.layer.borderColor = UIColor.redColor().CGColor
        fastestButton.layer.borderWidth = 4
        fastestButton.layer.cornerRadius = 5
    }
    
    func fastestSelected() {
        fastButton.layer.borderColor = UIColor.redColor().CGColor
        fastButton.layer.borderWidth = 4
        fastButton.layer.cornerRadius = 5
        
        fasterButton.layer.borderColor = UIColor.redColor().CGColor
        fasterButton.layer.borderWidth = 4
        fasterButton.layer.cornerRadius = 5
        
        fastestButton.layer.borderColor = UIColor.blueColor().CGColor
        fastestButton.layer.borderWidth = 4
        fastestButton.layer.cornerRadius = 5
    }

    @IBAction func fastTestAction(sender: AnyObject) {
        
        //queuePlayer.removeAllItems()
        fastTestLoop()
        //queuePlayer.play()
        //var it = queue.items()
        print("\(queue.items())")
        queue.play()
    }

    @IBAction func fasterTestAction(sender: AnyObject) {

        //queuePlayer.removeAllItems()
        //fasterTestLoop()
        //queuePlayer.play()
        
    }
    
    @IBAction func fastestTestAction(sender: AnyObject) {
        
        //queuePlayer.removeAllItems()
        //fastestTestLoop()
        //queuePlayer.play()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}