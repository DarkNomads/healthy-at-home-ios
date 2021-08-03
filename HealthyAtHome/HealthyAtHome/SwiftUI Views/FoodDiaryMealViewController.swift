//
//  FoodDiaryMealViewController.swift
//  HealthyAtHome
//
//  Created by Youmin Zhou on 7/31/21.
//

import UIKit

class FoodDiaryMealViewController: UIViewController {
    // Outlet labels and buttons
    @IBOutlet weak var breakfastList: UITextView!
    @IBOutlet weak var lunchList: UITextView!
    @IBOutlet weak var dinnerList: UITextView!
    @IBOutlet weak var snackList: UITextView!
    @IBOutlet weak var refreshButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .systemGreen
        refreshButton.layer.cornerRadius = 10
        breakfastList.isEditable = false
        lunchList.isEditable = false
        snackList.isEditable = false
        
        // Erase any food list
        breakfastList.text = nil
        lunchList.text = nil
        dinnerList.text = nil
        snackList.text = nil
        // Input food into list
        for i in 0..<globalMealBreakfastName.count{
            breakfastList.text.append("\(globalMealBreakfastName[i])\n")
            breakfastList.text.append("\(String(Int(globalMealBreakfastCal[i]))) Cal\n")
        }
        for i in 0..<globalMealLunchName.count{
            lunchList.text.append("\(globalMealLunchName[i])\n")
            lunchList.text.append("\(String(Int(globalMealLunchCal[i]))) Cal\n")
        }
        for i in 0..<globalMealDinnerName.count{
            dinnerList.text.append("\(globalMealDinnerName[i])\n")
            dinnerList.text.append("\(String(Int(globalMealDinnerCal[i]))) Cal\n")
        }
        for i in 0..<globalMealSnackName.count{
            snackList.text.append("\(globalMealSnackName[i])\n")
            snackList.text.append("\(String(Int(globalMealSnackCal[i]))) Cal\n")
        }
    }
    
    // When refresh button is hit
    @IBAction func didTapRefreshButton(_ sender: Any) {
        breakfastList.text = nil
        lunchList.text = nil
        dinnerList.text = nil
        snackList.text = nil
        for i in 0..<globalMealBreakfastName.count{
            breakfastList.text.append("\(globalMealBreakfastName[i])\n")
            breakfastList.text.append("\(String(Int(globalMealBreakfastCal[i]))) Cal\n")
        }
        for i in 0..<globalMealLunchName.count{
            lunchList.text.append("\(globalMealLunchName[i])\n")
            lunchList.text.append("\(String(Int(globalMealLunchCal[i]))) Cal\n")
        }
        for i in 0..<globalMealDinnerName.count{
            dinnerList.text.append("\(globalMealDinnerName[i])\n")
            dinnerList.text.append("\(String(Int(globalMealDinnerCal[i]))) Cal\n")
        }
        for i in 0..<globalMealSnackName.count{
            snackList.text.append("\(globalMealSnackName[i])\n")
            snackList.text.append("\(String(Int(globalMealSnackCal[i]))) Cal\n")
        }
    }
}
