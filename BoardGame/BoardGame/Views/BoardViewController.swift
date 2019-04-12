//
//  ViewController.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/11/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {

    @IBOutlet var cells: [CellView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addListeners()
        
        // sort outlet collection (cells)
        //cells = cells.sorted(by: {$0.tag < $1.tag})
       
    }

    private func addListeners() {
        for cell in cells {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(BoardViewController.selectCell))
            cell.addGestureRecognizer(gesture)
        }
    }
    
    @objc func selectCell(sender: UITapGestureRecognizer) {
        let tag = sender.view?.tag
        print(tag!)
    }
}

