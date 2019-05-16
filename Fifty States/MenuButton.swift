//
//  MenuButton.swift
//  RoundedButtons
//
//  Created by Justin Lewis on 2/24/17.
//  Copyright © 2017 DevTrain. All rights reserved.
//

import UIKit

class MenuButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        layer.borderWidth = 3
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
}
