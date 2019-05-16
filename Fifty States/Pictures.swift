//
//  Pictures.swift
//  Fifty States
//
//  Created by Eric Snow on 4/26/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit

class Pictures: UIImageView {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.borderWidth = 3
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        backgroundColor = .white
    }
    
    
    
    
}











