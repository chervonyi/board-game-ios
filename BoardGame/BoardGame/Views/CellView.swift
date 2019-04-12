//
//  CellView.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/11/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class CellView: UIView {
    
    private var imageView: UIImageView!
    
    var image: UIImage? {
        set {
            imageView.image = newValue
        }
    
        get {
            return imageView.image!
        }
    }
    
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
    
        // Replace image into this view
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.bounds = imageView.frame.insetBy(dx: 9, dy: 9)
        addSubview(imageView)
    }
    

}
