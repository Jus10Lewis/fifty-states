//
//  SettingsVC.swift
//  Fifty States
//
//  Created by Eric Snow on 3/2/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    @IBOutlet weak var nameSwitch: UISwitch!
    @IBOutlet weak var flagSwitch: UISwitch!
    @IBOutlet weak var infoSwitch: UISwitch!
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if !nameSwitch.isOn && !flagSwitch.isOn && !infoSwitch.isOn {
            if sender.tag == 101 {
                flagSwitch.isOn = true
            } else {
                nameSwitch.isOn = true
            }
        }
    }
    
    
    
    @IBAction func loadFlashcards(_ sender: UIButton) {
        let settings = [nameSwitch.isOn,
                        flagSwitch.isOn,
                        infoSwitch.isOn]
        
        if sender.tag == 222 {
            print("That's the spot")
            
        } else {
            print("Try again")
        }

        performSegue(withIdentifier: "ShowCard", sender: settings)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! StateInfoVC
        nextVC.settings = sender as? [Bool]
    }

}
