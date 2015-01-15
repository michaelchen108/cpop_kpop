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
    var chosenJayPictures = []
    var chosenJohnPictures = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tentativeHighScore = retrievedHighScore.highScore
        if tentativeHighScore >= 0 {
            highScore.text = NSString(format: "High Score: %3.d", tentativeHighScore)
        } else {
            highestscore.highScore = 0
            SaveHighScore().ArchiveHighScore(highScore: highestscore)
            println(retrievedHighScore.highScore)
            highScore.text = NSString(format: "High Score: %3.d", retrievedHighScore.highScore)
        }
        
        //playImage.image = something
        
        
        /*check this place for info on how the high score was done. still trying to figure it out myself... http://stackoverflow.com/questions/25985450/saving-highscores-with-nsuserdefaults
        */
        
    }
    
    func imageChooser () {
        //picking an image randomly from the two folders
        fm = NSFileManager.defaultManager()
        
        
        
    }
    
//this is an objective-C method method for getting the files, let's see if we can get it to work for swift
-(void)getContentOfImageDirectory
{
    //Emptying the image directory content array
    [_imageDirectoryContent removeAllObjects];

    //Using NSFileManager to load the content of the image directory in a temporary array
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *tempArray = [fm contentsOfDirectoryAtURL: _imageDirectory includingPropertiesForKeys: _imageProperties options: NSDirectoryEnumerationSkipsPackageDescendants error: nil];

    //Copy the temporary array into the imageDirectoryContent before returning the NSMutableArray imageDirectoryContent
    [_imageDirectoryContent addObjectsFromArray:tempArray];
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
