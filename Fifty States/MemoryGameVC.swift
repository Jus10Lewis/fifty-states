//
//  MemoryGameVC.swift
//  Fifty States
//
//  Created by Justin Lewis on 3/22/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit

class MemoryGameVC: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    
    var cardCount = 0
    var currentStates = [Int]()
    
    //MARK:- Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        cardCount = cardButtons.count
        
        dealNewCards(self)
    }
    
    //MARK:- Actions
    @IBAction func flipCard(_ sender: UIButton) {
        let tempImage = UIImage(named: "Texas")
        var thisButton: UIButton {
            for button in cardButtons {
                if button == sender {
                    return button
                }
            }
            return cardButtons[0]
        }
        
        thisButton.setBackgroundImage(tempImage, for: .normal)
        
    }

    @IBAction func peekAtCards(_ sender: Any) {
        showAllTheCards()
    }
    
    @IBAction func stopPeeking(_ sender: Any) {
        hideAllTheCards()
    }
    
    
    @IBAction func dealNewCards(_ sender: Any) {
        currentStates = []
        for _ in 0..<cardCount {
            var randStateID = 0
            repeat{
                randStateID = Int.random(in: 0...49)
            } while currentStates.contains(randStateID)
            currentStates.append(randStateID)
        }
    }
    
    //MARK:- My Methods
    func showAllTheCards() {
        for (cardNumber, stateIndex) in currentStates.enumerated() { //loop through the chosen states
            let thisStateName = stateDetails[stateIndex].name  // get the name of each state
            let thisStateImage = UIImage(named: thisStateName)  //get the flag image for that name
            cardButtons[cardNumber].setBackgroundImage(thisStateImage, for: .normal) //put the flag on the appropriate button
        }
    }
    
    func hideAllTheCards() {
        for card in cardButtons {
            card.setBackgroundImage(nil, for: .normal)
        }
    }
    

}
