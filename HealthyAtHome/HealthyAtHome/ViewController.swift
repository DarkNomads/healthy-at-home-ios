//
//  ViewController.swift
//  HealthyAtHome
//
//  Created by David Cao on 7/6/21.
//

import UIKit
import SwiftUI

//Defult ViewController
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// Sleep Tracker -----------------------------------------------------------------------------------------------------------------------------
class SleepTrackerViewController: UIViewController {
    
    var flag: Bool = false
    
    @IBOutlet weak var sleepHourLb: UILabel!
    @IBOutlet weak var sleepMinuteLb: UILabel!
    
    var dataCount = 0
    @IBOutlet weak var averageHourLb: UILabel!
    var totalHour: Int = 0
    @IBOutlet weak var averageMinuteLb: UILabel!
    var totalMinute: Int = 0
    
    @IBOutlet weak var wakeUpTimeLb: UILabel!
    @IBOutlet weak var bedTimeLb: UILabel!
    
    var sleepData: [Float] = []
    
    // Running the View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
    }
    
    @IBAction func didTapChartButton(_ sender: Any) {
        guard let chartViewCtl = storyboard?.instantiateViewController(identifier: "chart") as? SleepTrackerChartViewController else {
            print("Failed to get chart ViewController from storyboard")
            return
        }
        
        present(chartViewCtl, animated: true)
    }
    
    
    // Button Weekly Average
    @IBAction func didTapAverageButton(_ sender: Any) {
        var catcher: String = ""
        
        guard let settingViewCtl = storyboard?.instantiateViewController(identifier: "sleepSetting") as? SleepTrackerSettingViewController else {
            print("Failed to get chart ViewController from storyboard")
            return
        }
        settingViewCtl.sleepDataHourHandler = { text in
            self.sleepHourLb.text = text
        }
        settingViewCtl.sleepDataMinuteHandler = { text in
            self.sleepMinuteLb.text = text
        }
        settingViewCtl.wakeUpHandler = { text in
            self.wakeUpTimeLb.text = text
        }
        settingViewCtl.bedTimeHandler = { text in
            self.bedTimeLb.text = text
        }
        settingViewCtl.thrower = { text in
            catcher = text ?? "F"
            if (text == "T"){
                self.flag = true
            } else {
                self.flag = false
            }
        }
        
        // If user did edit
        if (self.flag) {
            // Hour and Minute
            var tempF: Float = 0.0
            var tempI: Int = 0
            var tempS: String = sleepHourLb.text!
            
            // Hour calculation
            tempF = Float(tempS) ?? 0.0
            tempI = Int(tempS) ?? 0
            totalHour = totalHour + tempI
            print("DataCount: ", dataCount)
            print("String: ",tempS)
            print("TotalHout: ", totalHour)
            print("TotalMinute: ", totalMinute)
            
            // Minute calculation
            tempS = sleepMinuteLb.text!
            tempF = tempF + (Float(tempS) ?? 0) / 60
            tempI = Int(tempS) ?? 0
            totalMinute = totalMinute + tempI
            print("String: ",tempS)
            print("TotalHout: ", totalHour)
            print("TotalMinute: ", totalMinute)
            
            // Data add to the queue for graph
            dataCount += 1
            if(dataCount > 0) {
                averageHourLb.text = String(totalHour/(dataCount))
                averageMinuteLb.text = String(totalMinute/(dataCount))
                sleepData.append(tempF)
            }
            
        }
        flag = false
        present(settingViewCtl, animated: true)
    }
    
    
    
    @IBAction func didTapGoal(_ sender: Any) {
        // same as button above
    }
}
// Food Diary
//class FoodDiaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    @IBOutlet weak var cardTableView: UITableView!
//
//    let titles_fd: [String] = ["Food Summary", "Breakfast", "Lunch", "Dinner", "Snack"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        cardTableView.isHidden = true
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return titles_fd.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
//
//
//        cell.configureFDTest(title: titles_fd[indexPath.row])
//
//        return UITableViewCell()
//    }
//}



// Profile -----------------------------------------------------------------------------------------------------------------------------
class ProfileViewController: UIViewController{

    // Running the View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}
