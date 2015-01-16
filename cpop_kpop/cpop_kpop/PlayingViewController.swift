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
    var counter = 0
    var jayImageCache = [Int: UIImage]()
    var johnImageCache = [Int: UIImage]()
    var chosenJayPictures = []
    var chosenJohnPictures = []
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for (var i = 0; i < 3; i++) {
            jayImageCache[i] = UIImage(named: "chou_jay \(i) .jpg")
        }
        
        playImage.image = jayImageCache[0]
        
        
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

    
    @IBAction func jayChou(sender: UIButton) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timer", userInfo: nil, repeats: false)
        score = score + 1
        
        //currentScore.text = "Score: \(score)"
        
        
        currentScore.text = NSString(format: "Score: %3.d", score)
        
        if score > retrievedHighScore.highScore {
            highestscore.highScore = score
            highestscore = HighScore()
            highestscore.highScore = score
            SaveHighScore().ArchiveHighScore(highScore: highestscore)
            highScore.text = NSString(format: "High Score: %3.d", score)
        }
    }
    
    @IBAction func johnCho(sender: UIButton) {
        timer.invalidate()
        
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
