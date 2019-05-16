//
//  MemoryGameVC.swift
//  Fifty States
//
//  Created by Justin Lewis on 3/22/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit
import AVFoundation

//FIXME: AUTOLAYOUT
//FIXME: Matched cards are still selectable
//FIXME: if cards matched delay, unless the user wants to quickly move on and tap a new card
//FIXME: StateNameLabels are not clearing out


class MemoryGameVC: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var turnCounterLabel: UILabel!
    @IBOutlet weak var firstStateLabel: UILabel!
    @IBOutlet weak var secondStateLabel: UILabel!

    var game: MemoryGame!
    var gameIsPausedForDelay = false
    
    //MARK:- Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        game = MemoryGame(numberOfCards: cardButtons.count)
        setButtonTags()
        showAllCards(self)
        afterDelay(1.0) {
            self.hideAllCards(self)
        }
        updateTurnCountLabel()
        clearStatenameLabels()
    }
    
    //MARK:- Actions
    @IBAction func flipCard(_ sender: UIButton) {
        
        if gameIsPausedForDelay {return}//Prevents selecting more that 2 cards quickly before they face down "afterdelay"
        
        if game.firstCardIndexSelected != nil, game.firstCardIndexSelected == sender.tag {
            //prevent user from selecting same card twice
            return
        }
        
        //update displays
        updateTurnCountLabel()
        let stateName = game.getStateNameFromCard(withIndex: sender.tag)
        let flagImage = UIImage(named: stateName)
        sender.setBackgroundImage(flagImage, for: .normal)
        
        playSound("card-flip")
        
        //Tell game model to check the selected card
        let didMatchCards = game.checkForMatch(cardNumber: sender.tag)
        
        
        //AFTER checkForMatch is called firstCardIndexSelected would have a value if this is the first card, or nil after comparing the second card.
        //if this was the second card in a turn...
        if game.firstCardIndexSelected == nil {
            secondStateLabel.text = stateName
            if didMatchCards {
                self.hideUnmatchedCards()
                self.clearStatenameLabels()
            } else {
                gameIsPausedForDelay = true
                afterDelay(1.0) {
                    self.gameIsPausedForDelay = false
                    self.hideUnmatchedCards()
                    self.clearStatenameLabels()
                }
            }
        } else {
            firstStateLabel.text = stateName
        }
        if game.isOver {
            playSound("win")
        }
    }
    

    @IBAction func showAllCards(_ sender: Any) {
        for (cardNumber, cardButton) in cardButtons.enumerated() { //loop through the chosen states
            let stateName = game.getStateNameFromCard(withIndex: cardNumber)
            let flagImage = UIImage(named: stateName)
            cardButton.setBackgroundImage(flagImage, for: .normal)
        }
    }
    
    @IBAction func hideAllCards(_ sender: Any) {
        hideUnmatchedCards()
    }
    
    
    @IBAction func dealNewCards(_ sender: Any) {
        game.dealNewCards(numberOfCards: cardButtons.count)
        hideUnmatchedCards()
        updateTurnCountLabel()
    }
    
    //MARK:- My Methods
    func setButtonTags() {
        for (index, button) in cardButtons.enumerated() {
            button.tag = index
        }
    }
    
    func hideUnmatchedCards() {
        let cardBackImage = UIImage(named: "cardback")
        for button in cardButtons {
            if button.tag == game.firstCardIndexSelected {
                continue
            }
            if !game.cards[button.tag].isMatched {
                button.setBackgroundImage(cardBackImage, for: .normal)
            }
        }
    }
    
    func clearStatenameLabels() {
        firstStateLabel.text = ""
        secondStateLabel.text = ""
    }
    
    func updateTurnCountLabel() {
        turnCounterLabel.text = "Turns: \(game.turnCount)"
    }

}
