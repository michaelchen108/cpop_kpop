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
    var score:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func jayChou(sender: UIButton) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timer", userInfo: nil, repeats: false)
        score = score + 1
        //currentScore.text = "Score: \(score)"
        currentScore.text = NSString(format: "Score: %3.d", String(score))
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
