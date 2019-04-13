//
//  ViewController.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/11/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit


protocol GameDelegate: class {
    func updateBoard()
}

class BoardViewController: UIViewController {

    @IBOutlet var cells: [CellView]!
    
    private var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addListeners()
        
        // Sort outlet collection (cells)
        cells = cells.sorted(by: {$0.tag < $1.tag})
       
        updateBoardView()
        
        game.delegate = self
    }

    func updateBoardView() {
        for cellView in cells {
            
            let cell = game.board[cellView.tag]
            
            if cell.isHighlighted {
                if cell.isEmpty {
                    cellView.setHighlight(backgroundColor: #colorLiteral(red: 0.9137254902, green: 1, blue: 0.9137254902, alpha: 1), borderColor: #colorLiteral(red: 0.8235294118, green: 0.9019607843, blue: 0.8235294118, alpha: 1))
                } else if cell.owner == Game.PlayerState.ENEMY {
                    cellView.setHighlight(backgroundColor: #colorLiteral(red: 0.9764705882, green: 0.9176470588, blue: 0.9176470588, alpha: 1), borderColor: #colorLiteral(red: 0.8823529412, green: 0.8274509804, blue: 0.8274509804, alpha: 1))
                } else {
                    cellView.setHighlight(backgroundColor: #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1), borderColor: #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1))
                }
            } else if game.selectedCell == cellView.tag {
                cellView.setHighlight(backgroundColor: #colorLiteral(red: 1, green: 0.9882352941, blue: 0.8901960784, alpha: 1), borderColor: #colorLiteral(red: 0.9019607843, green: 0.8901960784, blue: 0.8039215686, alpha: 1))
            } else {
                cellView.setHighlight(backgroundColor: #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1), borderColor: #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1))
            }
            
            if cell.isEmpty {
                cellView.image = nil
            } else {
                if cell.owner == Game.PlayerState.ALLIANCE {
                    cellView.image = UIImage(named: (cell.occupation?.blackFigureIcon)!)
                } else {
                    cellView.image = UIImage(named: (cell.occupation?.redFigureIcon)!)
                }
            }
        }
    }
    
    
    private func addListeners() {
        for cell in cells {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(BoardViewController.selectCell))
            cell.addGestureRecognizer(gesture)
        }
    }
    
    @objc func selectCell(sender: UITapGestureRecognizer) {
        let tag = sender.view?.tag
        
        game.selectedCell = tag!
        
        updateBoardView()
    }
}


extension BoardViewController: GameDelegate {
    func updateBoard() {
        updateBoardView()
    }
}
