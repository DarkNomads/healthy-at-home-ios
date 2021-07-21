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


// Sleep Tracker ----------------------------------------------------------------------
class SleepTrackerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var CardTableView: UITableView!
    
    let titles_ST: [String] = ["Sleep Data", "Sleep Goal", "Weekly Average", "Wake Up Goal", "Recommended Bedtime"]
    let unit: [String] = ["Hours","Hours","Hours","am","pm"]
    let hour: [String] = ["0","0","0","0","0"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        CardTableView.register(CardCell.self, forCellReuseIdentifier: CardCell.identifier)
        CardTableView.dataSource = self
    }
    
    // How many rows in the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles_ST.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        cell.cardView_ST.layer.borderWidth = 1
        cell.cardView_ST.layer.borderColor = UIColor.black.cgColor
        cell.cardView_ST.layer.cornerRadius = 30
        
        cell.configureSleepTracker(title: titles_ST[indexPath.row], unit: unit[indexPath.row], hour: hour[indexPath.row])
        cell.delegateSleepTracker = self
        return cell
    }
}


class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var CardTableView: UITableView!
    
    let titles_Pro: [String] = ["User Info", "Workouts", "Food Diet", "Sleep Tracker"]
    let data1: [String] = ["data1","data1","data1","data1"]
    let data2: [String] = ["data2","data2","data2","data2"]
    let data3: [String] = ["data3","data3","data3","data3"]
    let data4: [String] = ["data4","data4","data4","data4"]
    let unit1: [String] = ["unit1","unit1","unit1","unit1"]
    let unit2: [String] = ["unit2","unit2","unit2","unit2"]
    let unit3: [String] = ["unit3","unit3","unit3","unit3"]
    let unit4: [String] = ["unit4","unit4","unit4","unit4"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        CardTableView.register(CardCell.self, forCellReuseIdentifier: CardCell.identifier)
        CardTableView.dataSource = self
        
    }
    
    // How many rows in the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles_Pro.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        cell.cardView_Pro.layer.borderWidth = 1
        cell.cardView_Pro.layer.borderColor = UIColor.black.cgColor
        cell.cardView_Pro.layer.cornerRadius = 30
        
        cell.delegateProfile = self
        cell.configureProfile(title: titles_Pro[indexPath.row], data1: data1[indexPath.row], data2: data2[indexPath.row], data3: data3[indexPath.row], data4: data4[indexPath.row], unit1: unit1[indexPath.row], unit2: unit2[indexPath.row], unit3: unit3[indexPath.row], unit4: unit4[indexPath.row])
        
        return cell
    }
    
}

extension ProfileViewController: ProfileCellDelegate {
    func didTapProfileButton(with title: String) {
        print (title)
    }
}
extension SleepTrackerViewController: SleepTrackerCellDelegate {
    func didTapSleepTrackerButton(with title: String) {
        print (title)
    }
    
}
