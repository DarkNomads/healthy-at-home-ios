//
//  ViewController.swift
//  HealthyAtHome
//
//  Created by David Cao on 7/6/21.
//

import UIKit
import SwiftUI

// Public variables shared between View Controllers

// Sleep Tracker
public var globalSleepData: [Double] = []
public var globalSleepDataHours: String? = "0"
public var globalSleepDataMinutes: String? = "0"
public var globalWeeklyAverageHours: [Int] = []
public var globalWeeklyAverageMinutes: [Int] = []
public var globalWeeklyAverageHoursDisplay: String? = "0"
public var globalWeeklyAverageMinutesDisplay: String? = "0"
public var globalWakeUpTime: String? = "0"
public var globalBedTime: String? = "0"

// Global Functions
// See if an array[Int] is empty, return true if empty
public func arrayIntIsEmpty(input: [Int?]) -> Bool {
    if (input.count  <= 0){
        return true
    } else {
        return false
    }
}
// See if an array[Double] is empty, return true if empty
public func arrayDoubleIsEmpty(input: [Double?]) -> Bool {
    if (input.count  <= 0){
        return true
    } else {
        return false
    }
}

//Defult ViewController
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// Sleep Tracker -----------------------------------------------------------------------------------------------------------------------------
class SleepTrackerViewController: UIViewController {
    
    @IBOutlet weak var sleepHourLb: UILabel!
    @IBOutlet weak var sleepMinuteLb: UILabel!
    @IBOutlet weak var averageHourLb: UILabel!
    @IBOutlet weak var averageMinuteLb: UILabel!
    @IBOutlet weak var wakeUpTimeLb: UILabel!
    @IBOutlet weak var bedTimeLb: UILabel!

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
        guard let settingViewCtl = storyboard?.instantiateViewController(identifier: "sleepSetting") as? SleepTrackerSettingViewController else {
            print("Failed to get chart ViewController from storyboard")
            return
        }
        
        // Set wake up and bed time
        settingViewCtl.wakeUpHandler = { text in
            self.wakeUpTimeLb.text = text
            
        }
        settingViewCtl.bedTimeHandler = { text in
            self.bedTimeLb.text = text
        }
        
        // If data exist
        if (!arrayIntIsEmpty(input: globalWeeklyAverageHours)){
            var hour: Int = 0
            var minute: Int = 0
            let tempValue: Double = globalSleepData.reduce(0, +) / Double(globalSleepData.count)
            print ("Temp: ", tempValue) // debug
            hour = Int(tempValue)
            minute = Int((tempValue - Double(Int(tempValue))) * 60)
            averageHourLb.text = String(hour)
            averageMinuteLb.text = String(minute)
        }
        present(settingViewCtl, animated: true)
        
        // debug section
        print ("Sleep data array: ", globalSleepData)
        print ("Average hour: ", globalWeeklyAverageHours)
        print ("Average minute: ", globalWeeklyAverageMinutes)
        print ("Wake up: ", globalWakeUpTime!)
        print ("Bed Time: ", globalBedTime!)
        
    }
    
    
    @IBAction func didTapGoal(_ sender: Any) {
        // same as button above
    }
}
// Food Diary




// Profile -----------------------------------------------------------------------------------------------------------------------------
class ProfileViewController: UIViewController{

    // Running the View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}
