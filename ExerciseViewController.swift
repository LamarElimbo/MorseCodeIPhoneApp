//
//  ExerciseViewController.swift
//  morse code
//
//  Created by Preferred Customer on 2016-03-13.
//  Copyright © 2016 Lawinjo. All rights reserved.
//

import UIKit
import GameplayKit
import AVFoundation

class ExerciseViewController: UIViewController, AVAudioPlayerDelegate {
    
    // MARK: - View Properties
    
    @IBOutlet weak var languageSwitch: UISegmentedControl!
    @IBOutlet weak var morseView: UIView!
    @IBOutlet weak var englishView: UIView!
    
    @IBOutlet weak var display: UILabel!
    
    var allWords = [String]()
  
    @IBOutlet weak var symSoundSwitch: UISegmentedControl!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var replayLetterButton: UIButton!
    @IBOutlet weak var replayWordButton: UIButton!
    
    @IBOutlet weak var inputField: UITextField!
    var inputME: String?
    @IBOutlet weak var englishInputField: UILabel!
    var englishInput = String()
    
    @IBOutlet weak var dashButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var spaceButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    var holder = String()

    @IBOutlet weak var gradeButtonME: UIButton!
    @IBOutlet weak var gradeButton: UIButton!
    @IBOutlet weak var gradeField: UIImageView!
    @IBOutlet weak var englishGradeField: UIImageView!
    
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBOutlet weak var englishShowAnswerButton: UIButton!
    
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var englishCorrectAnswer: UILabel!
    
    @IBOutlet weak var morseChart: UIImageView!
    @IBOutlet weak var closeChartButton: UIButton!
    
    var newWord: String?
    
    var i: Int = 0
    var k: Int = 0
    var characterConversion: [Character]!
    
    // MARK: - Sound Functionality

    var queuePlayer = AVQueuePlayer()
    var playerItem: AVPlayerItem?
    
    @IBAction func playAction(sender: AnyObject) {
        print("queue items = \(queuePlayer.items())")
        queuePlayer.play()
        playButton.hidden = true
        pauseButton.hidden = false
    }
    
    @IBAction func pauseAction(sender: AnyObject) {
        queuePlayer.pause()
        playButton.hidden = false
        pauseButton.hidden = true
    }
    
    @IBAction func replayLetterAction(sender: AnyObject) {
        switch k {
        case 0: i = 0
        case 1: i = 1
        case 2: i = 2
        case 3: i = 3
        case 4: i = 4
        case 5: i = 5
        case 6: i = 6
        case 7: i = 7
        default: print("cannot replay letter")
        }
    }
    
    @IBAction func replayWordAction(sender: AnyObject) {
        queuePlayer.removeAllItems()
        translateToSound()
    }

    func playDotNow() {
        
        print("S", terminator: "")  // play dot sound
        
        let dot500Path = NSBundle.mainBundle().pathForResource("fasterDot500", ofType: "mp3")!
        let dot500Url = NSURL(fileURLWithPath: dot500Path)
        playerItem = AVPlayerItem(URL: dot500Url)

        queuePlayer.insertItem(playerItem!, afterItem: nil)
        
    }
    
    func playDashNow() {
        
        print("L", terminator: "")  // play dash sound
        
        let dash500Path = NSBundle.mainBundle().pathForResource("fasterDash500", ofType: "mp3")!
        let dash500Url = NSURL(fileURLWithPath: dash500Path)
        playerItem = AVPlayerItem(URL: dash500Url)

        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }
    
    func playPause1() {
        
        print("P", terminator: "")  // play pause sound
        
        k++
        
        let pausePath = NSBundle.mainBundle().pathForResource("fastPause3", ofType: "mp3")!
        let pauseUrl = NSURL(fileURLWithPath: pausePath)
        playerItem = AVPlayerItem(URL: pauseUrl)

        queuePlayer.insertItem(playerItem!, afterItem: nil)
    }

// MARK: - View Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        if let wordListPath = NSBundle.mainBundle().pathForResource("start", ofType: "txt") {
            if let wordList = try? String(contentsOfFile: wordListPath, usedEncoding: nil) {
                allWords = wordList.componentsSeparatedByString("\n")
            } else {
                allWords = ["abnormal"]
            }
        }
        morseView.layer.zPosition = 0.5
        morseChart.hidden = true
        closeChartButton.hidden = true
        englishView.hidden = true
        newWordAction()
        playButton.hidden = true
        pauseButton.hidden = true
        replayLetterButton.hidden = true
        replayWordButton.hidden = true
        gradeButton.hidden = true
    }
    
    @IBAction func languageSwitch(sender: AnyObject) {
        newWordAction()
        playButton.hidden = true
        pauseButton.hidden = true
        replayLetterButton.hidden = true
        replayWordButton.hidden = true
        if sender.selectedSegmentIndex == 0 {
            englishView.hidden = true
            morseView.hidden = false
            symSoundSwitch.selectedSegmentIndex = 0
            gradeButton.hidden = true
            gradeButtonME.hidden = false
            inputField.text = ""
        } else {
            englishView.hidden = false
            morseView.hidden = true
            englishInputField.text = ""
            gradeButton.hidden = false
            gradeButtonME.hidden = true
        }
    }
    
    @IBAction func symSoundSwitchAction(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0 {
            playButton.hidden = true
            pauseButton.hidden = true
            replayLetterButton.hidden = true
            replayWordButton.hidden = true
            display.text = holder
        } else {
            translateToSound()
            playButton.hidden = false
            pauseButton.hidden = true
            replayLetterButton.hidden = false
            replayWordButton.hidden = false
            display.text = ""
        }
    }
    
    @IBAction func inputField(sender: AnyObject) {
        inputME = self.inputField.text
        gradeInputME()
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func dashAction(sender: AnyObject) {
        englishInput += "- "
        englishInputField.text = englishInput
        gradeButton.hidden = false
    }
    
    @IBAction func dotAction(sender: AnyObject) {
        englishInput += "● "
        englishInputField.text = englishInput
        gradeButton.hidden = false
    }
    
    @IBAction func spaceAction(sender: AnyObject) {
        englishInput += "| "
        englishInputField.text = englishInput
        gradeButton.hidden = false
    }
    
    @IBAction func backAction(sender: AnyObject) {
        var backspace = englishInput.characters.count
        var index = backspace - 2
        englishInput = (englishInput as NSString).substringToIndex(index)
        englishInputField.text = englishInput
        gradeButton.hidden = false
    }
    
    @IBAction func gradeAction(sender: AnyObject) {
        
        if languageSwitch.selectedSegmentIndex == 0 {
            gradeButtonME.hidden = true
            gradeInputME()
        } else {
            gradeButton.hidden = true
            gradeInputEM()
        }
    }
    
    @IBAction func showAnswerAction(sender: AnyObject) {
        
        showAnswerButton.hidden = true
        
        if languageSwitch.selectedSegmentIndex == 0 {
            correctAnswer.text = newWord
        } else {
            englishCorrectAnswer.text = holder
        }
    }
    
    @IBAction func chartAction(sender: AnyObject) {
        morseChart.hidden = false
        morseChart.layer.zPosition = 0.9
        closeChartButton.hidden = false
        closeChartButton.layer.zPosition = 1
    }
    
    @IBAction func closeChartAction(sender: AnyObject) {
        morseChart.hidden = true
        closeChartButton.hidden = true
    }
    
    @IBAction func refreshAction(sender: AnyObject) {
        newWordAction()
        
        if languageSwitch.selectedSegmentIndex == 0 {
            inputField.text = ""
            correctAnswer.text = ""
            gradeField.hidden = false
            gradeButtonME.hidden = false
            gradeField.image = nil
            playButton.hidden = true
            pauseButton.hidden = true
            replayLetterButton.hidden = true
            replayWordButton.hidden = true
            symSoundSwitch.selectedSegmentIndex = 0
            queuePlayer.pause()
            queuePlayer.removeAllItems()
        } else {
            englishInputField.text = ""
            englishCorrectAnswer.text = ""
            gradeButton.hidden = false
            englishGradeField.hidden = false
        }
    }
    
    func newWordAction() {
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(allWords) as! [String]
        newWord = allWords[0]
        print("\(newWord)")
        showAnswerButton.hidden = false
        correctAnswer.text = ""
        
        if languageSwitch.selectedSegmentIndex == 0 {
            translate()
        } else {
            display.text = newWord
            translate()
            print("\(holder)")
        }
    }
    
    func translate() {
        
        var result = ""
        
        characterConversion = [Character](newWord!.characters)

        for i = 0; i < characterConversion.count; i++ {
            
            switch characterConversion[i] {
            
            case "a", "A":
                result += "● - | "
                holder = result
            case "b", "B":
                result += "- ● ● ● | "
                holder = result
            case "c", "C":
                result += "- ● - ● | "
                holder = result
            case "d", "D":
                result += "- ● ● | "
                holder = result
            case "e", "E":
                result += "● | "
                holder = result
            case "f", "F":
                result += "● ● - ● | "
                holder = result
            case "g", "G":
                result += "- - ● | "
                holder = result
            case "h", "H":
                result += "● ● ● ● | "
                holder = result
            case "i", "I":
                result += "● ● | "
                holder = result
            case "j", "J":
                result += "● - - - | "
                holder = result
            case "k", "K":
                result += "- ● - | "
                holder = result
            case "l", "L":
                result += "● - ● ● | "
                holder = result
            case "m", "M":
                result += "- - | "
                holder = result
            case "n", "N":
                result += "- ● | "
                holder = result
            case "o", "O":
                result += "- - - | "
                holder = result
            case "p", "P":
                result += "● - - ● | "
                holder = result
            case "q", "Q":
                result += "- - ● - | "
                holder = result
            case "r", "R":
                result += "● - ● | "
                holder = result
            case "s", "S":
                result += "● - ● | "
                holder = result
            case "t", "T":
                result += "- | "
                holder = result
            case "u", "U":
                result += "● ● - | "
                holder = result
            case "v", "V":
                result += "● ● ● - | "
                holder = result
            case "w", "W":
                result += "● - - | "
                holder = result
            case "x", "X":
                result += "- ● ● - | "
                holder = result
            case "y", "Y":
                result += "- ● - - | "
                holder = result
            case "z", "Z":
                result += "- - ● ● | "
                holder = result
            case "1":
                result += "● - - - - | "
                holder = result
            case "2":
                result += "● ● - - - | "
                holder = result
            case "3":
                result += "● ● ● - - | "
                holder = result
            case "4":
                result += "● ● ● ● - - | "
                holder = result
            case "5":
                result += "● ● ● ● ● | "
                holder = result
            case "6":
                result += "- ● ● ● ● | "
                holder = result
            case "7":
                result += "- - ● ● ● | "
                holder = result
            case "8":
                result += "- - - ● ● | "
                holder = result
            case "9":
                result += "- - - - ● | "
                holder = result
            case "0":
                result += "- - - - - | "
                holder = result
            default:
                print("not a letter or number")
            }
        }
        
        if languageSwitch.selectedSegmentIndex == 0 {
            display.text = holder
        }
    }
    
    func translateToSound() {
        
        characterConversion = [Character](holder.characters)
        
        for i = 0; i < characterConversion.count; i++ {
            switch characterConversion[i]
            {
            case "-": playDashNow()
            case "●": playDotNow()
            case "|": playPause1()
            default:  break
            }
        }
    }
    
    func gradeInputME() {
        gradeButtonME.hidden = true
        print("input: \(inputME), newWord: \(newWord)")
        if inputME == newWord {
            print("correct!")
            gradeField.image = UIImage(named: "RightAnswer")
            
        } else {
            print("incorrect")
            gradeField.image = UIImage(named: "WrongAnswer")
            
        }
    }
    func gradeInputEM() {
        gradeButton.hidden = true
        
        englishInput += "| "
        if englishInput == holder {
            print("correct!")
            englishGradeField.image = UIImage(named: "RightAnswer")
            
        } else {
            print("\(englishInput)")
            print("\(holder)")
            print("incorrect")
            englishGradeField.image = UIImage(named: "WrongAnswer")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
