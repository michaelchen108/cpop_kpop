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
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for (var i = 0; i < 6; i++) {
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
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timer", userInfo: nil, repeats: false)

        
        //currentScore.text = "Score: \(score)"
        
        
        currentScore.text = NSString(format: "Score: %3.d", score)
        
        if score > retrievedHighScore.highScore {
            highestscore.highScore = score
            highestscore = HighScore()
            highestscore.highScore = score
            SaveHighScore().ArchiveHighScore(highScore: highestscore)
            highScore.text = NSString(format: "High Score: %3.d", score)
        }
        
        if isJay {
            score = score + 1
            setImage()
        } else {
            self.navigationController.pushViewController(FinalViewController, animated: true)
        }
    }
    
    @IBAction func johnCho(sender: UIButton) {
        timer.invalidate()
        if isJay != true {
            score = score + 1
            setImage()
        } else {
            self.navigationController.pushViewController(FinalViewController, animated: true)
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
