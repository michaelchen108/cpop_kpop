//
//  SecondOpeningViewController.swift
//  cpop_kpop
//
//  Created by Michael Chen on 2/2/15.
//  Copyright (c) 2015 Michael Chen. All rights reserved.
//

import UIKit

class SecondOpeningViewController: UIViewController {

    @IBOutlet var jayImage: UIImageView!
    
    @IBOutlet var johnImage: UIImageView!
    
    @IBOutlet var highScoreLabel: UILabel!

    @IBAction func play(sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let playScreen = storyBoard.instantiateViewControllerWithIdentifier("PlayingViewController") as PlayingViewController
        self.presentViewController(playScreen, animated:true, completion:nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        jayImage.image = UIImage(named: "johnCho.jpg")
        johnImage.image = UIImage(named: "jayChou.jpg")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
}
