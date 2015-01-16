//
//  PlayingViewController.swift
//  cpop_kpop
//
//  Created by Michael Chen on 1/13/15.
//  Copyright (c) 2015 Michael Chen. All rights reserved.
//

import UIKit

class PlayingViewController: UIViewController {

    @IBOutlet var playImage: UIImageView!
    @IBOutlet var currentScore: UILabel!
    @IBOutlet var highScore: UILabel!
    var timer:NSTimer = NSTimer()
    var score: Int = 0
    var userDefaults = NSUserDefaults.standardUserDefaults()
    var highestscore = HighScore()
    var retrievedHighScore = SaveHighScore().RetrieveHighScore() as HighScore
    var imageCache = [Int: UIImage]()
    var isJay = false
    var disableTimer = false
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        score = 0
        
        for (var i = 0; i < 14; i++) {
            if(i % 2 == 0)
            {
                //even images are jay
                imageCache[i] = UIImage(named: "chou_jay\(i/2).jpg")
            }
            else
            {
                //odd images are john
                imageCache[i] = UIImage(named: "cho_john\(i/2).jpg")
            }
        }
        
        setImage()
        callForWait()
        
        
        
        let tentativeHighScore = retrievedHighScore.highScore
        if tentativeHighScore >= 0 {
            highScore.text = NSString(format: "High Score: %3.d", tentativeHighScore)
        } else {
            highestscore.highScore = 0
            SaveHighScore().ArchiveHighScore(highScore: highestscore)
            println(retrievedHighScore.highScore)
            highScore.text = NSString(format: "High Score: %3.d", retrievedHighScore.highScore)
        }

        
        /*check this place for info on how the high score was done. still trying to figure it out myself... http://stackoverflow.com/questions/25985450/saving-highscores-with-nsuserdefaults
        */
        
    }
    
    
    func callForWait(){
        //setting the delay time 1secs.
        let delay = 1 * Double(NSEC_PER_SEC)
        var time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            //call the method which have the steps after delay.
            if self.disableTimer {
                self.disableTimer = false
            } else {
                self.stepsAfterDelay()
            }
        }
        
    }
    
    
    func stepsAfterDelay(){
        displayScoreScreen()
    }
    
    
    
    func getScore() -> Int {
        return self.score
    }
    
    
    func setImage () {
        var randInt = Int(arc4random_uniform(UInt32(imageCache.count)))
        if randInt%2 == 0 {
            isJay = true
        } else {
            isJay = false
        }
        playImage.image = imageCache[randInt]
    }

    
    @IBAction func jayChou(sender: UIButton) {
        
        if score > retrievedHighScore.highScore {
            highestscore.highScore = score
            highestscore = HighScore()
            highestscore.highScore = score
            SaveHighScore().ArchiveHighScore(highScore: highestscore)
            highScore.text = NSString(format: "High Score: %3.d", score)
        }
        
        if isJay {
            updateScore()
            setImage()
            self.disableTimer = true
            callForWait()
        } else {
            displayScoreScreen()
        }
    }
    
    @IBAction func johnCho(sender: UIButton) {
        //timer.invalidate()
        if score > retrievedHighScore.highScore {
            highestscore.highScore = score
            highestscore = HighScore()
            highestscore.highScore = score
            SaveHighScore().ArchiveHighScore(highScore: highestscore)
            highScore.text = NSString(format: "High Score: %3.d", score)
        }
        if isJay != true {
            updateScore()
            setImage()
            self.disableTimer = true
            callForWait()
        } else {
            displayScoreScreen()
        }
        
        

    }
    
    func createAndStartTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timer", userInfo: nil, repeats: false)
        timer.fire()
    }
    
    
    func updateScore() {
        score = score + 1
        currentScore.text = NSString(format: "Score: %3.d", score)
    }
    
    
    
    func displayScoreScreen() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let scoreScreen = storyBoard.instantiateViewControllerWithIdentifier("FinalViewController") as FinalViewController
        
        NSLog("\(score)")
        
        scoreScreen.setScore(self.score)
        
        self.presentViewController(scoreScreen, animated:true, completion:nil)
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
