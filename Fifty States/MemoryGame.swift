//
//  MemoryGame.swift
//  Fifty States
//
//  Created by Justin Lewis on 4/5/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import Foundation
import AVFoundation

struct MemoryGame {
    
    private(set) var cards = [MemoryCard]()
    
    private(set) var firstCardIndexSelected: Int?
    
    private(set) var turnCount = 0
    
    let synthesizer = AVSpeechSynthesizer()

    
    var isOver: Bool {
        get {
            for card in cards {
                if !card.isMatched {
                    return false
                }
            }
            return true
        }
    }
    
    init(numberOfCards: Int) {
        dealNewCards(numberOfCards: numberOfCards)
    }

    mutating func dealNewCards(numberOfCards: Int) {
        let numberOfMatches = numberOfCards/2
        cards.removeAll()
        for _ in 0..<numberOfMatches {
            
            var newCard: MemoryCard
            repeat{
                newCard = MemoryCard()
            } while (cards.contains(where: { $0.stateID == newCard.stateID }))
            
            cards.append(newCard)
            cards.append(newCard)
        }
        cards.shuffle()
        turnCount = 0
        firstCardIndexSelected = nil
    }
    
    
    mutating func checkForMatch(cardNumber: Int) -> Bool {
        
        let stateName = getStateNameFromCard(withIndex: cardNumber)
        
//        synthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: stateName)
        synthesizer.speak(utterance)
        
        
        guard let firstCardIndex = firstCardIndexSelected else {
            //if this is the first card selected in a turn, then store the card index and don't do anything else. You can't do any matching on a single card
            firstCardIndexSelected = cardNumber
            return false
        }
        
        //reset the optional "firstCardIndexSelected" because after the turn is over, no cards are selected
        firstCardIndexSelected = nil
        
        //Two cards have been selected. So check for a match.
        turnCount += 1
        let secondCardIndex = cardNumber
        if cards[firstCardIndex].stateID == cards[secondCardIndex].stateID {
            cards[firstCardIndex].isMatched = true
            cards[secondCardIndex].isMatched = true
            playSound("correct")
            return true
        } else {
            playSound("wrong")
            return false
        }
        


    }
    
    func getStateNameFromCard(withIndex cardIndex: Int) -> String {
        let stateID = cards[cardIndex].stateID
        let stateName = stateDetails[stateID].name
        return stateName
    }
    
    
    
//    
//    
//    ///// Plays sound "soundName".mp3
//    var player:AVAudioPlayer = AVAudioPlayer()
//    mutating func playSound (_ soundName: String){
//        let audioPath = NSString(string: Bundle.main.path(forResource: soundName, ofType: "mp3")!)
//        do {
//            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath as String))
//        } catch _ {
//            //player = nil
//        }
//        player.play()
//    }

    
}
