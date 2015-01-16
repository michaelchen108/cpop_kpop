//
//  FinalViewController.swift
//  cpop_kpop
//
//  Created by Seunghun Oh on 1/13/15.
//  Copyright (c) 2015 Michael Chen. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    
    @IBOutlet var finalScore: UILabel!
    
    finalScore.text = NSString(format: "Score: %3.d", score)
    
   
}
