//
//  ViewController.swift
//  HealthyAtHome
//
//  Created by David Cao on 7/6/21.
//

import UIKit
import SwiftUI
//import SwiftUICharts

//Defult ViewController
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
// Todo:
    // Add View Controller for (if necessary)
        // 1. Home Page
        // 2. Food diary
        // 3. Workout


// Sleep Tracker -----------------------------------------------------------------------------------------------------------------------------
class SleepTrackerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Link to Card View
    @IBOutlet weak var CardTableView: UITableView!
    
    // Some Testing Data
    let titles_ST: [String] = ["Sleep Data", "Sleep Goal", "Weekly Average", "Wake Up Goal", "Recommended Bedtime"]
    let unit: [String] = ["Hours","Hours","Hours","am","pm"]
    let hour: [String] = ["0","0","0","0","0"]
    
    // Running the View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        // Register to recognize which View is using, in this case using Sleep Tracker page
        CardTableView.register(CardCell.self, forCellReuseIdentifier: CardCell.identifier)
        CardTableView.dataSource = self
    }
    
    // How many rows in the card view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles_ST.count
    }
    
    // Add defult data into the cell, and change cell format
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        cell.cardView_ST.layer.borderWidth = 1
        cell.cardView_ST.layer.borderColor = UIColor.black.cgColor
        cell.cardView_ST.layer.cornerRadius = 30
        
        cell.delegateSleepTracker = self
        cell.configureSleepTracker(title: titles_ST[indexPath.row], unit: unit[indexPath.row], hour: hour[indexPath.row])
        
        return cell
    }
}

// Profile -----------------------------------------------------------------------------------------------------------------------------
class ProfileViewController: UIViewController{

    // Running the View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}

// Control each individual cell in Sleep Tracker page
extension SleepTrackerViewController: SleepTrackerCellDelegate {
    func didTapSleepTrackerButton(with title: String) {
        print (title)
    }
    
}
