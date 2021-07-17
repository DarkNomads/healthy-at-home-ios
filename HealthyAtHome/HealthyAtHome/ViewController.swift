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
    
    let pictures: [UIImage] = [UIImage(named: "Bar-Chart-Trans.png")!,UIImage(named: "empty.png")!,UIImage(named: "empty.png")!,UIImage(named: "empty.png")!,UIImage(named: "empty.png")!,UIImage(named: "empty.png")!]
    let titles: [String] = ["Sleep Data", "", "", "", "",""]
    let unit: [String] = ["Hours","Hours","Hours","am","pm",""]
    let hour: [String] = ["0","0","0","0","0",""]
    let bigTitle: [String] = ["", "Daily Sleep Goal", "Weekly Average", "Wake Up Goal", "Recommended Bedtime", "Edit Sleep Routine"]
    
//    let controller = UIHostingController(rootView: SleepTrackerChart())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .systemIndigo
//        addChild(controller)
        
        
//        view.addSubview(controller.view)
//
//        controller.view.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            controller.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//            //controller.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//        ])
        
    }
    
    
    
    
    //how many rows in the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    // Defines what cells are being used
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        cell.configure(picture: pictures[indexPath.row], title: titles[indexPath.row], unit: unit[indexPath.row], hour: hour[indexPath.row], bigTitle: bigTitle[indexPath.row])
        return cell
    }
    
}


