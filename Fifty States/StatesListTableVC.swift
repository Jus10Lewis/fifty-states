//
//  StatesListTableVC.swift
//  Fifty States
//
//  Created by Eric Snow on 1/24/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit

class StatesListTableVC: UITableViewController {

    let cellIdentifier = "StateCell"
    var stateSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateDetails.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StateTableCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! StateTableCell
        cell.cellLabel?.textColor = .white
        
        cell.cellLabel.text = stateDetails[indexPath.row].name
        cell.flagImage.image = UIImage(named: stateDetails[indexPath.row].name)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        stateSelected = stateDetails[indexPath.row].abbreviation
        performSegue(withIdentifier: "ShowState", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let controller = segue.destination as! StateInfoVC
            controller.stateIndexNumber = sender as? Int
    }
}
