//
//  EndViewController.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/15/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttonRestart: UIButton!
    
    var userWon = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if userWon {
            label.text = "YOU WON"
        } else {
            label.text = "YOU LOSE"
        }
        
        buttonRestart.layer.cornerRadius = 15
        buttonRestart.layer.masksToBounds = true
    }

    
    @IBAction func onClickRestart(_ sender: UIButton) {
        performSegue(withIdentifier: "Restart", sender: self)
    }
}
