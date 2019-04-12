//
//  CellView.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/11/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class CellView: UIView {

    private var image = #imageLiteral(resourceName: "sorket_b")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
        layer.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
        
        
        
        // Image:
//        let imageView = UIImageView(image: image)
//        imageView.bounds = imageView.frame.insetBy(dx: 10, dy: 10)
//        addSubview(imageView)
        
        
    }
    

}
