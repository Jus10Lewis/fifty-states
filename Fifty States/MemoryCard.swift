//
//  MemoryCard.swift
//  Fifty States
//
//  Created by Justin Lewis on 4/5/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import Foundation


struct MemoryCard {

    private(set) var stateID: Int
    var isMatched = false
    

    init() {
        stateID = Int.random(in: 0...49)
    }
    
}
