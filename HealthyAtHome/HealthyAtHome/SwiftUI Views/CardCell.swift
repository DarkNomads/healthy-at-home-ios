//
//  CardCell.swift
//  HealthyAtHome
//
//  Created by Youmin Zhou on 7/16/21.
//

import UIKit

// Protocol to tell specific View Controller what function to use.
protocol ProfileCellDelegate: AnyObject {
    func didTapProfileButton(with title: String)
}

protocol SleepTrackerCellDelegate: AnyObject {
    func didTapSleepTrackerButton(with title: String)
}
// Todo:
        // Add protocol for (if necessary)
                // 1. Home Page
                // 2. Food diary
                // 3. Workout

class CardCell: UITableViewCell {
    
    // Defult setting
    private var defultTitle: String = ""
    static let identifier = "CardCell"
    
    // Delegate for each page
    weak var delegateProfile: ProfileCellDelegate?
    weak var delegateSleepTracker: SleepTrackerCellDelegate?
    // Todo:
            // Add delegate for (if necessary)
                // 1. Home Page
                // 2. Food diary
                // 3. Workout
    
    
    // Button on each card (I made the button invisiable, but you can check the storyboard and see it)
    @IBOutlet weak var profileButton: UIButton!
    @IBAction func didTapProfileButton() {
        delegateProfile?.didTapProfileButton(with: defultTitle)
    }
    @IBOutlet weak var sleepTrackerButton: UIButton!
    @IBAction func didTapSleepTrackerButton() {
        delegateSleepTracker?.didTapSleepTrackerButton(with: defultTitle)
    }
    // Todo:
            // Add buttons for (if necessary)
                // 1. Home Page
                // 2. Food diary
                // 3. Workout
    
    
    // Sleep Tracker
    @IBOutlet weak var cardView_ST: UIView!
    @IBOutlet weak var unitLabel_ST: UILabel!
    @IBOutlet weak var hourLabel_ST: UILabel!
    @IBOutlet weak var titleLabel_ST: UILabel!
    
    // Profile
    @IBOutlet weak var cardView_Pro: UIView!
    @IBOutlet weak var titleLabel_Pro: UILabel!
    @IBOutlet weak var data1_Pro: UILabel!
    @IBOutlet weak var data2_Pro: UILabel!
    @IBOutlet weak var data3_Pro: UILabel!
    @IBOutlet weak var data4_Pro: UILabel!
    @IBOutlet weak var unit1_Pro: UILabel!
    @IBOutlet weak var unit2_Pro: UILabel!
    @IBOutlet weak var unit3_Pro: UILabel!
    @IBOutlet weak var unit4_Pro: UILabel!
    
    // Todo:
            // implement elements for
                // 1. Home Page
                // 2. Food diary
                // 3. Workout
    
    // Set up the cell for Sleep tracker
    func configureSleepTracker(title: String, unit: String, hour: String) {
        self.defultTitle = title
        titleLabel_ST.text = title
        unitLabel_ST.text = unit
        hourLabel_ST.text = hour
    }
    // Set up the cell for Profile
    func configureProfile(title: String, data1: String, data2: String, data3: String, data4: String,
                          unit1: String, unit2: String, unit3: String, unit4: String) {
        self.defultTitle = title
        titleLabel_Pro.text = title
        data1_Pro.text = data1
        data2_Pro.text = data2
        data3_Pro.text = data3
        data4_Pro.text = data4
        unit1_Pro.text = unit1
        unit2_Pro.text = unit2
        unit3_Pro.text = unit3
        unit4_Pro.text = unit4
    }
    
    // Todo:
        // Add configuration for
            // 1. Home Page
            // 2. Food diary
            // 3. Workout
}
