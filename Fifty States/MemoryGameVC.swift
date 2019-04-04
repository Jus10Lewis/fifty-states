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
    
    var currentStates = [Int]()
    
    //MARK:- Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTags()
        dealNewCards(self)
        stopPeeking(self)
    }
    
    
    //MARK:- Actions
    @IBAction func flipCard(_ sender: UIButton) {
        let thisStateIndex = currentStates[sender.tag]
        let thisStateName = stateDetails[thisStateIndex].name  // get the name of each state
        let tempImage = UIImage(named: thisStateName)
        
        sender.setBackgroundImage(tempImage, for: .normal)
        
//        var thisButton: UIButton {
//            for button in cardButtons {
//                if button == sender {
//                    return button
//                }
//            }
//            return cardButtons[0]
//        }
//        thisButton.setBackgroundImage(tempImage, for: .normal)
    }

    @IBAction func peekAtCards(_ sender: Any) {
        for (cardNumber, stateIndex) in currentStates.enumerated() { //loop through the chosen states
            let thisStateName = stateDetails[stateIndex].name  // get the name of each state
            let thisStateImage = UIImage(named: thisStateName)  //get the flag image for that name
            cardButtons[cardNumber].setBackgroundImage(thisStateImage, for: .normal) //put the flag on the appropriate button
        }
    }
    
    @IBAction func stopPeeking(_ sender: Any) {
        let cardBackImage = UIImage(named: "USAcardback")
        for card in cardButtons {
            card.setBackgroundImage(cardBackImage, for: .normal)
        }
    }
    
    
    @IBAction func dealNewCards(_ sender: Any) {
        currentStates = []
        for _ in 0..<cardButtons.count {
            var randStateID = 0
            repeat{
                randStateID = Int.random(in: 0...49)
            } while currentStates.contains(randStateID)
            currentStates.append(randStateID)
        }
    }
    
    //MARK:- My Methods
    func setButtonTags() {
        for (index, button) in cardButtons.enumerated() {
            button.tag = index
        }
    }
    
    
    

}
