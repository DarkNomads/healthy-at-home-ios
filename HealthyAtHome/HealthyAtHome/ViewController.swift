//
//  ViewController.swift
//  HealthyAtHome
//
//  Created by David Cao on 7/6/21.
//

import UIKit
import SwiftUI

// Public variables shared between View Controllers

// Food Diary
public var globalMealBreakfastName: [String] = []
public var globalMealLunchName: [String] = []
public var globalMealDinnerName: [String] = []
public var globalMealSnackName: [String] = []
public var globalMealBreakfastCal: [Double] = []
public var globalMealLunchCal: [Double] = []
public var globalMealDinnerCal: [Double] = []
public var globalMealSnackCal: [Double] = []
public var globalMealBreakfastCalDisplay: String = "0"
public var globalMealLunchCalDisplay: String = "0"
public var globalMealDinnerCalDispaly: String = "0"
public var globalTotalCalDisplay: String = "0"
public var globalWaterDisplay: String = "0"
public var globalCalGoal: String = "0"
public var globalCalRemain: String = "0"

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


//Defult ViewController
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// Home-----------------------------------------------------------------------------------------------------------------------------

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var calorieRemainLb: UILabel!
    @IBOutlet weak var averageSleepLb: UILabel!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    // Running the View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButton.layer.cornerRadius = 10
    }
    
    @IBAction func didTapRefreshButton(_ sender: Any) {
        calorieRemainLb.text = globalCalRemain
        averageSleepLb.text = String(format: "%.2f", globalSleepData.reduce(0, +) / Double(globalSleepData.count))
    }
}



// Food Diary -----------------------------------------------------------------------------------------------------------------------------

class FoodDiaryViewController: UIViewController{
    
    @IBOutlet weak var breakfastCalLb: UILabel!
    @IBOutlet weak var lunchCalLb: UILabel!
    @IBOutlet weak var dinnerCalLb: UILabel!
    @IBOutlet weak var consumedCalLb: UILabel!
    @IBOutlet weak var waterLb: UILabel!
    @IBOutlet weak var calGoalLb: UILabel!
    @IBOutlet weak var calRemainLb: UILabel!
    
    // Running the View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
    
    // When Meal button tapped (Button 1)
    // Should display food list
    @IBAction func didTapMealButton(_ sender: Any) {
        guard let mealViewCtl = storyboard?.instantiateViewController(identifier: "meal") as?
            FoodDiaryMealViewController else {
            print("Failed to get meal ViewController from storyboard")
            return
        }
        present(mealViewCtl, animated: true, completion: nil)
    }
    
    // When Food button tapped (Button 2)
    @IBAction func didTapFoodButton(_ sender: Any) {
        guard let foodViewCtl = storyboard?.instantiateViewController(identifier: "food") as?
            FoodDiaryFoodViewController else {
            print ("Failed to get food & water ViewController from storyboard")
            return
        }
        foodViewCtl.breakfastCalHandler = { text in
            self.breakfastCalLb.text = text
        }
        foodViewCtl.lunchCalHandler = { text in
            self.lunchCalLb.text = text
        }
        foodViewCtl.dinnerCalHandler = { text in
            self.dinnerCalLb.text = text
        }
        foodViewCtl.calorieHandler = { text in
            self.consumedCalLb.text = text
        }
        foodViewCtl.waterHandler = { text in
            self.waterLb.text = text
        }
        foodViewCtl.calorieGoalHandler = { text in
            self.calGoalLb.text = text
        }
        foodViewCtl.calorieRemainHandler = { text in
            self.calRemainLb.text = text
        }
        present(foodViewCtl, animated: true, completion: nil)
    }
    
    @IBAction func didTapCalorieButton(_ sender: Any) {
        // Same as Food Button
        guard let foodViewCtl = storyboard?.instantiateViewController(identifier: "food") as?
            FoodDiaryFoodViewController else {
            print ("Failed to get food & water ViewController from storyboard")
            return
        }
        foodViewCtl.breakfastCalHandler = { text in
            self.breakfastCalLb.text = text
        }
        foodViewCtl.lunchCalHandler = { text in
            self.lunchCalLb.text = text
        }
        foodViewCtl.dinnerCalHandler = { text in
            self.dinnerCalLb.text = text
        }
        foodViewCtl.calorieHandler = { text in
            self.consumedCalLb.text = text
        }
        foodViewCtl.waterHandler = { text in
            self.waterLb.text = text
        }
        foodViewCtl.calorieGoalHandler = { text in
            self.calGoalLb.text = text
        }
        foodViewCtl.calorieRemainHandler = { text in
            self.calRemainLb.text = text
        }
        present(foodViewCtl, animated: true, completion: nil)
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
        guard let settingViewCtl = storyboard?.instantiateViewController(identifier: "sleepSetting") as? SleepTrackerSettingViewController else {
            print("Failed to get chart ViewController from storyboard")
            return
        }
        // Set wake up and bed time
        settingViewCtl.hourHandlder = { text in
            self.sleepHourLb.text = text
        }
        settingViewCtl.minuteHandler = { text in
            self.sleepMinuteLb.text = text
        }
        settingViewCtl.wakeUpHandler = { text in
            self.wakeUpTimeLb.text = text
        }
        settingViewCtl.bedTimeHandler = { text in
            self.bedTimeLb.text = text
        }
        settingViewCtl.averageHourHandler = { text in
            self.averageHourLb.text = text
        }
        settingViewCtl.averageMinuteHandler = { text in
            self.averageMinuteLb.text = text
        }
        present(settingViewCtl, animated: true)
        
        // debug section
        print ("Sleep data array: ", globalSleepData)
        print ("Average hour: ", globalWeeklyAverageHours)
        print ("Average minute: ", globalWeeklyAverageMinutes)
        print ("Wake up: ", globalWakeUpTime!)
        print ("Bed Time: ", globalBedTime!)
//        guard let chartViewCtl = storyboard?.instantiateViewController(identifier: "chart") as? SleepTrackerChartViewController else {
//            print ("Failed to get chart ViewController from storyboard")
//            return
//        }
//        // chart goes here
//        present(chartViewCtl, animated: true)
    }
    
    // Button Weekly Average
    @IBAction func didTapAverageButton(_ sender: Any) {
        guard let settingViewCtl = storyboard?.instantiateViewController(identifier: "sleepSetting") as? SleepTrackerSettingViewController else {
            print("Failed to get chart ViewController from storyboard")
            return
        }
        // Set wake up and bed time
        settingViewCtl.hourHandlder = { text in
            self.sleepHourLb.text = text
        }
        settingViewCtl.minuteHandler = { text in
            self.sleepMinuteLb.text = text
        }
        settingViewCtl.wakeUpHandler = { text in
            self.wakeUpTimeLb.text = text
        }
        settingViewCtl.bedTimeHandler = { text in
            self.bedTimeLb.text = text
        }
        settingViewCtl.averageHourHandler = { text in
            self.averageHourLb.text = text
        }
        settingViewCtl.averageMinuteHandler = { text in
            self.averageMinuteLb.text = text
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
        guard let settingViewCtl = storyboard?.instantiateViewController(identifier: "sleepSetting") as? SleepTrackerSettingViewController else {
            print("Failed to get chart ViewController from storyboard")
            return
        }
        // Set wake up and bed time
        settingViewCtl.hourHandlder = { text in
            self.sleepHourLb.text = text
        }
        settingViewCtl.minuteHandler = { text in
            self.sleepMinuteLb.text = text
        }
        settingViewCtl.wakeUpHandler = { text in
            self.wakeUpTimeLb.text = text
        }
        settingViewCtl.bedTimeHandler = { text in
            self.bedTimeLb.text = text
        }
        settingViewCtl.averageHourHandler = { text in
            self.averageHourLb.text = text
        }
        settingViewCtl.averageMinuteHandler = { text in
            self.averageMinuteLb.text = text
        }
        present(settingViewCtl, animated: true)
        
        // debug section
        print ("Sleep data array: ", globalSleepData)
        print ("Average hour: ", globalWeeklyAverageHours)
        print ("Average minute: ", globalWeeklyAverageMinutes)
        print ("Wake up: ", globalWakeUpTime!)
        print ("Bed Time: ", globalBedTime!)
    }
}

class WorkoutTrackerViewController: UIViewController{
    
    @IBOutlet weak var warmupMinGoal: UILabel!
    @IBOutlet weak var warmupMinRemaining: UILabel!
    @IBOutlet weak var workoutCalGoal: UILabel!
    @IBOutlet weak var workoutCalRemaining: UILabel!
    @IBOutlet weak var cooldownMinGoal: UILabel!
    @IBOutlet weak var cooldownMinRemaining: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
    }
    
    // When Warmup button tapped (Button 1)
    // Goes to editor
    @IBAction func didTapWarmup(_ sender: Any) {
        guard let workoutViewCtl = storyboard?.instantiateViewController(identifier: "workoutSetting") as? WorkoutViewController else {print("Failed to get workout view controller from storyboard")
            return
        }
        present(workoutViewCtl, animated: true, completion: nil)
    }
    
    // When workout button tapped (Button 2)
    // Goes to editor
    @IBAction func didTapWorkout(_ sender: Any) {
        guard let workoutViewCtl = storyboard?.instantiateViewController(identifier: "workoutSetting") as? WorkoutViewController else {print("Failed to get workout view controller from storyboard")
            return
        }
        present(workoutViewCtl, animated:true, completion: nil)
    }
    
    // When cooldown button tapped (Button 3)
    // Goes to editor
    @IBAction func didTapCooldown(_ sender: Any) {
        guard let workoutViewCtl = storyboard?.instantiateViewController(identifier: "workoutSetting") as? WorkoutViewController else {
            print("Failed to get workout view controller from storyboard")
            return
        }
        present(workoutViewCtl, animated: true, completion: nil)
    }
    
    
    
    
}


// Profile -----------------------------------------------------------------------------------------------------------------------------
class ProfileViewController: UIViewController{
    
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var heightLb: UILabel!
    @IBOutlet weak var weightLb: UILabel!
    @IBOutlet weak var weightGoalLb: UILabel!
    @IBOutlet weak var workoutGoalLb: UILabel!
    @IBOutlet weak var weeklyWeighInLb: UILabel!
    @IBOutlet weak var sleepGoalLb: UILabel!

    // Running the View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
    @IBAction func editProfile(_ sender: Any) {
        let pvc = storyboard?.instantiateViewController(identifier: "ppe_vc") as! ProfileEditorViewController
        pvc.modalPresentationStyle = .fullScreen
        
        pvc.nameHandler = {text in
            if (text != ""){
                self.nameLb.text = text
            }
        }
        pvc.heightHandler = {text in
            if (text != "'"){
                self.heightLb.text = text
            }
        }
        pvc.weightHandler = {text in
            if (text != ""){
                self.weightLb.text = text
            }
        }
        pvc.weightGoalHandler = {text in
            if (text != ""){
                self.weightGoalLb.text = text
            }
        }
        pvc.workoutGoalHandler = {text in
            if (text != ""){
                self.workoutGoalLb.text = text
            }
        }
        pvc.weighInDayHandler = {text in
            if (text != ""){
                self.weeklyWeighInLb.text = text
            }
        }
        pvc.sleepGoalHandler = {text in
            if (text != ""){
                self.sleepGoalLb.text = text
            }
        }
        
        present(pvc, animated: true)
    }
}
