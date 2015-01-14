//
//  PlayingViewController.swift
//  cpop_kpop
//
//  Created by Michael Chen on 1/13/15.
//  Copyright (c) 2015 Michael Chen. All rights reserved.
//

import UIKit

class PlayingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //myButton.addTarget(self, action: "buttonTapped:", forControlEvents: .TouchUpInside)
        
        var timer = NSTimer()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "timer", userInfo: nil, repeats: true)
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        timer == nil
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
