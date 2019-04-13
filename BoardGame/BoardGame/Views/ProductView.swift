//
//  ProductView.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import UIKit

class ProductView: UIView {

    private var imageView: UIImageView!
    
    var image: UIImage? {
        set {
            imageView.image = newValue
        }
        get {
            return imageView.image!
        }
    }
    
    var isHighlighted: Bool {
        set {
            if newValue {
                layer.borderWidth = 2
                layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
        
        get {
            return layer.borderWidth != 0
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
        
        layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // Replace image into this view
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        //imageView.bounds = imageView.frame.insetBy(dx: 9, dy: 9)
        addSubview(imageView)
    }
}
