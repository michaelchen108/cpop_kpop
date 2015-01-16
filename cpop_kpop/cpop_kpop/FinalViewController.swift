//
//  FinalViewController.swift
//  cpop_kpop
//
//  Created by Michael Chen on 1/15/15.
//  Copyright (c) 2015 Michael Chen. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet var finalScore: UILabel!
    
    let playScreen = PlayingViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        finalScore.text = NSString(format: "Score: %3.d", playScreen.getScore())
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
