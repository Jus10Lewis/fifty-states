//
//  StateInfoVC.swift
//  Fifty States
//
//  Created by Eric Snow on 1/24/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit

class StateInfoVC: UIViewController {
    
    @IBOutlet weak var stateNameLabel: UILabel!
    @IBOutlet weak var stateAbbreviationLabel: UILabel!
    @IBOutlet weak var stateFlagImage: UIImageView!
    @IBOutlet weak var stateCapitalLabel: UILabel!
    @IBOutlet weak var stateBirdLabel: UILabel!
    @IBOutlet weak var stateBirdImage: UIImageView!
    @IBOutlet weak var stateFlowerImage: UIImageView!
    @IBOutlet weak var stateFlowerLabel: UILabel!
    
    let numberOfStates = 50
    var stateIndexNumber: Int?
    var birdImageName = ""
    var flowerImageName = ""
    
    var settings: [Bool]?
    var isFlashcard = false
    var isFrontOfCard = true
    var someInfoIsHidden = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(settings ?? "No Settings")


        if let settings = settings {
        
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))

            isFlashcard = true
            rollRandomState()
            for setting in settings {
                if setting == false {
                    someInfoIsHidden = true
                }
            }

        }
        hideSomeStuff()
        updateDisplay()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! WebVC
        if let stateIndexNumber = stateIndexNumber {
            controller.stateName = stateDetails[stateIndexNumber].name
        }
    }
    
    func rollRandomState() {
        stateIndexNumber = Int.random(in: 0..<numberOfStates)
    }
    
    
    @objc func handleTap() {
        if isFrontOfCard && someInfoIsHidden{
            isFrontOfCard = false
            showAllTheThings()
            updateDisplay()
        } else {
            isFrontOfCard = true
            hideSomeStuff()
            rollRandomState()
            updateDisplay()
        }
    }
    
    
    func updateDisplay () {
        if let nameOfState = stateIndexNumber {
            birdImageName = stateDetails[nameOfState].abbreviation + "bird"
            flowerImageName = stateDetails[nameOfState].abbreviation + "flower"
            stateNameLabel.text = stateDetails[nameOfState].name
            stateAbbreviationLabel.text = stateDetails[nameOfState].abbreviation
            stateFlagImage.image = UIImage.init(named: stateDetails[nameOfState].name)
            stateCapitalLabel.text = stateDetails[nameOfState].capital
            stateBirdLabel.text = stateDetails[nameOfState].bird
            stateBirdImage.image = UIImage.init(named: birdImageName)
            stateFlowerImage.image = UIImage.init(named: flowerImageName)
            stateFlowerLabel.text = stateDetails[nameOfState].flower
        }
    }
    
    func hideSomeStuff () {
        guard let settings = settings else {
            return
        }
        if !settings[0] {
            stateNameLabel.isHidden = true
            stateAbbreviationLabel.isHidden = true
        }
        if !settings[1]{
            stateFlagImage.isHidden = true
        }
        if !settings[2]{
            stateFlagImage.isHidden = true
            stateCapitalLabel.isHidden = true
            stateBirdLabel.isHidden = true
            stateBirdImage.isHidden = true
            stateFlowerImage.isHidden = true
            stateFlowerLabel.isHidden = true
        }
    }
    
    func showAllTheThings() {
        stateNameLabel.isHidden = false
        stateAbbreviationLabel.isHidden = false
        stateFlagImage.isHidden = false
        stateFlagImage.isHidden = false
        stateCapitalLabel.isHidden = false
        stateBirdLabel.isHidden = false
        stateBirdImage.isHidden = false
        stateFlowerImage.isHidden = false
        stateFlowerLabel.isHidden = false
    }


}
