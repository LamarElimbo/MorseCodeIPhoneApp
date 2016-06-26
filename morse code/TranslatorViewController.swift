//
//  TranslatorViewController.swift
//  morse code
//
//  Created by Preferred Customer on 2016-04-05.
//  Copyright © 2016 Lawinjo. All rights reserved.
//

import UIKit
import AVFoundation

class TranslatorViewController: UIViewController, UITextViewDelegate {
    
    var characterConversion = [Character]()
    var characterPush = [Character]()
    var pushHolder = ""
    var result = ""
    var i = 0
    var k = 0
    var holder = ""
    var input = ""
    
    // MARK: EM View
    
    @IBOutlet weak var EMView: UIView!
    @IBOutlet weak var inputFieldEM: UITextView!
    @IBOutlet weak var outputFieldEM: UITextView!
    @IBOutlet weak var playSoundButtonEM: UIButton!
    @IBOutlet weak var pauseSoundButtonEM: UIButton!
    @IBOutlet weak var restartSoundButtonEM: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.title = "English  →  Morse"
        EMView.hidden = false
        MEView.hidden = true
        inputFieldEM.delegate = self
        playSoundButtonEM.hidden = false
        pauseSoundButtonEM.hidden = true
        restartSoundButtonEM.hidden = true
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func playSoundActionEM(sender: AnyObject) {
        queuePlayer.play()
        playSoundButtonEM.hidden = true
        pauseSoundButtonEM.hidden = false
        restartSoundButtonEM.hidden = false
    }
    
    @IBAction func pauseSoundActionEM(sender: AnyObject) {
        queuePlayer.pause()
        playSoundButtonEM.hidden = false
        pauseSoundButtonEM.hidden = true
        restartSoundButtonEM.hidden = true
    }
    
    @IBAction func restartSoundAction(sender: AnyObject) {
        queuePlayer.removeAllItems()
        translateToSound()
        playSoundButtonEM.hidden = false
        pauseSoundButtonEM.hidden = true
        restartSoundButtonEM.hidden = true
    }
    
    @IBAction func translateActionEM(sender: AnyObject) {
        print("translate to morse button pushed")

        playSoundButtonEM.hidden = false
        pauseSoundButtonEM.hidden = true
        restartSoundButtonEM.hidden = true
        
        input = ""
        input = inputFieldEM.text
        holder = ""
        result = ""
        outputFieldEM.text = ""
        
        characterConversion = [Character](input.characters)
        
        for i = 0; i < characterConversion.count; i++ {
            
            switch characterConversion[i] {
                
            case "a", "A":
                result += "●-   "
                holder = result
            case "b", "B":
                result += "-●●●   "
                holder = result
            case "c", "C":
                result += "-●-●   "
                holder = result
            case "d", "D":
                result += "-●●   "
                holder = result
            case "e", "E":
                result += "●   "
                holder = result
            case "f", "F":
                result += "●●-●   "
                holder = result
            case "g", "G":
                result += "--●   "
                holder = result
            case "h", "H":
                result += "●●●●   "
                holder = result
            case "i", "I":
                result += "●●   "
                holder = result
            case "j", "J":
                result += "●---   "
                holder = result
            case "k", "K":
                result += "-●-   "
                holder = result
            case "l", "L":
                result += "●-●●   "
                holder = result
            case "m", "M":
                result += "--   "
                holder = result
            case "n", "N":
                result += "-●   "
                holder = result
            case "o", "O":
                result += "---   "
                holder = result
            case "p", "P":
                result += "●--●   "
                holder = result
            case "q", "Q":
                result += "--●-   "
                holder = result
            case "r", "R":
                result += "●-●   "
                holder = result
            case "s", "S":
                result += "●●●   "
                holder = result
            case "t", "T":
                result += "-   "
                holder = result
            case "u", "U":
                result += "●●-   "
                holder = result
            case "v", "V":
                result += "●●●-   "
                holder = result
            case "w", "W":
                result += "●--   "
                holder = result
            case "x", "X":
                result += "-●●-   "
                holder = result
            case "y", "Y":
                result += "-●--   "
                holder = result
            case "z", "Z":
                result += "--●●   "
                holder = result
            case "1":
                result += "●----   "
                holder = result
            case "2":
                result += "●●---   "
                holder = result
            case "3":
                result += "●●●--   "
                holder = result
            case "4":
                result += "●●●●--   "
                holder = result
            case "5":
                result += "●●●●●   "
                holder = result
            case "6":
                result += "-●●●●   "
                holder = result
            case "7":
                result += "--●●●   "
                holder = result
            case "8":
                result += "---●●   "
                holder = result
            case "9":
                result += "----●   "
                holder = result
            case "0":
                result += "-----   "
                holder = result
            case " ":
                result += "/   "
                holder = result
            case ".":
                result += "●-●-●-●   "
                holder = result
            case ",":
                result += "--●●--   "
                holder = result
            case "?":
                result += "●●--●●   "
                holder = result
            case "/":
                result += "-●●-●   "
                holder = result
            case "@":
                result += "●●●-●-   "
                holder = result
            default:
                print("not a letter or number")
            }
        }
        input = ""
        outputFieldEM.text = ""
        outputFieldEM.text = holder
        queuePlayer.removeAllItems()
        translateToSound()
    }
    
    @IBAction func switchModeAction(sender: AnyObject) {
        
        inputFieldEM.text = ""
        inputFieldME.text = ""
        holder = ""
        result = ""
        outputFieldEM.text = ""
        outputFieldME.text = ""
        
        if MEView.hidden == true {
            MEView.hidden = false
            EMView.hidden = true
            self.title = "Morse  →  English"
        } else if MEView.hidden == false {
            MEView.hidden = true
            EMView.hidden = false
            self.title = "English  →  Morse"
        }
    }
    
    // MARK: ME View
    
    @IBOutlet weak var MEView: UIView!
    @IBOutlet weak var inputFieldME: UITextView!
    @IBOutlet weak var outputFieldME: UITextView!
    
    @IBAction func translateActionME(sender: AnyObject) {
        print("translate to english button pushed")
        input = ""
        input = inputFieldME.text
        holder = ""
        result = ""
        outputFieldME.text = ""
        
        characterPush = [Character](input.characters)
        
        for k = 0; k < characterPush.count; k++ {
            if characterPush[k] == "●" {
                pushHolder += "●"
            } else if characterPush[k] == "-" {
                pushHolder += "-"
            } else if characterPush[k] == "/" {
                result += " "
            } else if characterPush[k] == " " {
                
                if characterPush[k-1] == " " {
                    pushHolder += ""
                } else {
                    switch pushHolder {
                        
                    case "●-":
                        result += "a"
                        holder = result
                    case "-●●●":
                        result += "b"
                        holder = result
                    case "-●-●":
                        result += "c"
                        holder = result
                    case "-●●":
                        result += "d"
                        holder = result
                    case "●":
                        result += "e"
                        holder = result
                    case "●●-●":
                        result += "f"
                        holder = result
                    case "--●":
                        result += "g"
                        holder = result
                    case "●●●●":
                        result += "h"
                        holder = result
                    case "●●":
                        result += "i"
                        holder = result
                    case "●---":
                        result += "j"
                        holder = result
                    case "-●-":
                        result += "k"
                        holder = result
                    case "●-●●":
                        result += "l"
                        holder = result
                    case "--":
                        result += "m"
                        holder = result
                    case "-●":
                        result += "n"
                        holder = result
                    case "---":
                        result += "o"
                        holder = result
                    case "●--●":
                        result += "p"
                        holder = result
                    case "--●-":
                        result += "q"
                        holder = result
                    case "●-●":
                        result += "r"
                        holder = result
                    case "●●●":
                        result += "s"
                        holder = result
                    case "-":
                        result += "t"
                        holder = result
                    case "●●-":
                        result += "u"
                        holder = result
                    case "●●●-":
                        result += "v"
                        holder = result
                    case "●--":
                        result += "w"
                        holder = result
                    case "-●●-":
                        result += "x"
                        holder = result
                    case "-●--":
                        result += "y"
                        holder = result
                    case "--●●":
                        result += "z"
                        holder = result
                    case "●----":
                        result += "1"
                        holder = result
                    case "●●---":
                        result += "2"
                        holder = result
                    case "●●●--":
                        result += "3"
                        holder = result
                    case "●●●●--":
                        result += "4"
                        holder = result
                    case "●●●●●":
                        result += "5"
                        holder = result
                    case "-●●●●":
                        result += "6"
                        holder = result
                    case "--●●●":
                        result += "7"
                        holder = result
                    case "---●●":
                        result += "8"
                        holder = result
                    case "----●":
                        result += "9"
                        holder = result
                    case "-----":
                        result += "0"
                        holder = result
                    case "●-●-●-●":
                        result += "."
                        holder = result
                    case "--●●--":
                        result += ","
                        holder = result
                    case "●●--●●":
                        result += "?"
                        holder = result
                    case "-●●-●":
                        result += "/"
                        holder = result
                    case "●●●-●-":
                        result += "@"
                        holder = result
                    default:
                        print("not morse code")
                    }
                }
                pushHolder = ""
            }
        }
        
        input = ""
        outputFieldME.text = ""
        outputFieldME.text = holder
    }
    
    // MARK: - Sound Functionality
    
    var queuePlayer = AVQueuePlayer()
    var playerItem: AVPlayerItem?
    
    func playDotNow() {
        
        let dot500Path = NSBundle.mainBundle().pathForResource("fasterDot500", ofType: "mp3")!
        let dot500Url = NSURL(fileURLWithPath: dot500Path)
        playerItem = AVPlayerItem(URL: dot500Url)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
        
    }
    
    func playDashNow() {
        
        let dash500Path = NSBundle.mainBundle().pathForResource("fasterDash500", ofType: "mp3")!
        let dash500Url = NSURL(fileURLWithPath: dash500Path)
        playerItem = AVPlayerItem(URL: dash500Url)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    func playPause1() {
        
        let pausePath = NSBundle.mainBundle().pathForResource("fastPause3", ofType: "mp3")!
        let pauseUrl = NSURL(fileURLWithPath: pausePath)
        playerItem = AVPlayerItem(URL: pauseUrl)
        
        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }

    func translateToSound() {

        queuePlayer.pause()
        
        var translation = ""
        var check = outputFieldEM.text
        var translateHolder = [Character](check.characters)
        
        for i = 0; i < translateHolder.count; i++ {
            
            if translateHolder[i] == "●" {
                translation += "●"
            } else if translateHolder[i] == "-" {
                translation += "-"
            } else if translateHolder[i] == "/" {
                translation += ""
            } else if translateHolder[i] == " " {
                
                if translateHolder[i-1] == " " {
                    translation += ""
                } else {
                    translation += " "
                }
            }

        }
        var check2 = translation
        var soundPush = [Character](translation.characters)
        
        for i = 0; i < soundPush.count; i++ {
            
            switch soundPush[i]
            {
            case "-": playDashNow()
            case "●": playDotNow()
            case " ": playPause1()
            default:  break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
