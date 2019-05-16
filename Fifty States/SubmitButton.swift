//
//  SubmitButton.swift
//  Fifty States
//
//  Created by Justin Lewis on 4/26/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit

class SubmitButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        setTitleColor(.white, for: .normal)
    }
}
