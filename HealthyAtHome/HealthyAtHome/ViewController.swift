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
    
    let circleImage: UIImage = UIImage(named: "circle_indigo.png")!
    let titles: [String] = ["Sleep Data", "Sleep Goal", "Weekly Average", "Wake Up Goal", "Recommended Bedtime"]
    let unit: [String] = ["Hours","Hours","Hours","am","pm"]
    let hour: [String] = ["0","0","0","0","0"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        //CardTableView.dataSource = self
        //CardTableView.delegate = self

    }
    
    // How many rows in the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    // Defines what cells are being used
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        cell.cardView.layer.borderWidth = 1
        cell.cardView.layer.borderColor = UIColor.black.cgColor
        cell.cardView.layer.cornerRadius = 30
        
        cell.configure(picture: circleImage, title: titles[indexPath.row], unit: unit[indexPath.row], hour: hour[indexPath.row])
        return cell
    }
}


