//
//  CardButton.swift
//  Fifty States
//
//  Created by Justin Lewis on 5/8/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit

class CardButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.borderWidth = 3
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.masksToBounds = true
    }
}
