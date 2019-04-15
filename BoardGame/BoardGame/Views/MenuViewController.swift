//
//  MenuViewController.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/15/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var buttonMultiplayer: UIButton!
    @IBOutlet weak var buttonTutorial: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonPlay.layer.cornerRadius = 15
        buttonPlay.layer.masksToBounds = true
        buttonMultiplayer.layer.cornerRadius = 15
        buttonMultiplayer.layer.masksToBounds = true
        buttonTutorial.layer.cornerRadius = 15
        buttonTutorial.layer.masksToBounds = true
    }

    @IBAction func onClickPlay(_ sender: UIButton) {
        performSegue(withIdentifier: "toPlay", sender: self)
    }
}
