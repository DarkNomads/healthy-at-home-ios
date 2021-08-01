//
//  FoodDiaryFoodViewController.swift
//  HealthyAtHome
//
//  Created by Youmin Zhou on 7/31/21.
//

import UIKit

class FoodDiaryFoodViewController: UIViewController {

    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var calorie: UITextField!
    @IBOutlet weak var selectSlider: UISlider!
    @IBOutlet weak var setFoodButton: UIButton!
    @IBOutlet weak var water: UITextField!
    @IBOutlet weak var setWaterButton: UIButton!
    @IBOutlet weak var calorieGoal: UITextField!
    @IBOutlet weak var setCalorieGoalButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    public var breakfastCalHandler:((String?) -> Void)?
    public var lunchCalHandler:((String?) -> Void)?
    public var dinnerCalHandler:((String?) -> Void)?
    public var calorieHandler:((String?) -> Void)?
    public var waterHandler:((String?) -> Void)?
    public var calorieGoalHandler:((String?) -> Void)?
    public var calorieRemainHandler:((String?) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
        
        foodName.layer.cornerRadius = 10
        calorie.layer.cornerRadius = 10
        setFoodButton.layer.cornerRadius = 10
        setCalorieGoalButton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 10
    }
    
    // Input warning
    func showAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: {action in
            print("Tapped Dismiss")
        }))
        present(alert, animated: true, completion: nil)
    }
    // Limit slider to only four options
    @IBAction func changeTip(_ sender: UISlider) {
        selectSlider.value = roundf(selectSlider.value)
    }
    
    // Set food button
    @IBAction func didTapSetFoodButton(_ sender: Any) {
        var checkPoint: Bool = true
        if (!foodName.hasText || !calorie.hasText){
            showAlert(titleInput: "Forgot Something?", messageInput: "No input for food name or calorie")
            checkPoint = false
        } else {
            switch selectSlider.value {
            case 1:
                globalMealBreakfastName.append(foodName.text!)
                globalMealBreakfastCal.append(Double(calorie.text!)!)
            case 2:
                globalMealLunchName.append(foodName.text!)
                globalMealLunchCal.append(Double(calorie.text!)!)
            case 3:
                globalMealDinnerName.append(foodName.text!)
                globalMealDinnerCal.append(Double(calorie.text!)!)
            case 4:
                globalMealSnackName.append(foodName.text!)
                globalMealSnackCal.append(Double(calorie.text!)!)
            default:
                print ("Error with slider")
            }
        }
        if (checkPoint){
            var tempBCal: Double = 0
            var tempLCal: Double = 0
            var tempDCal: Double = 0
            var tempSCal: Double = 0
            var tempTotal: Int = 0
            tempBCal = globalMealBreakfastCal.reduce(0, +)
            tempLCal = globalMealLunchCal.reduce(0, +)
            tempDCal = globalMealDinnerCal.reduce(0, +)
            tempSCal = globalMealSnackCal.reduce(0, +)
            tempTotal = Int(tempBCal + tempLCal + tempDCal + tempSCal)
            globalCalRemain = String(Int(globalCalGoal)! - tempTotal)
            breakfastCalHandler?(String(Int(tempBCal)))
            lunchCalHandler?(String(Int(tempLCal)))
            dinnerCalHandler?(String(Int(tempDCal)))
            calorieHandler?(String(Int(tempTotal)))
            calorieRemainHandler?(globalCalRemain)
            dismiss(animated: true, completion: nil)
        }
    }
    // Set water Button
    @IBAction func didTapSetWater(_ sender: Any) {
        var checkPoint: Bool = true
        if (!water.hasText){
            showAlert(titleInput: "Forgot Something?", messageInput: "No input for water (Oz)")
            checkPoint = false
        } else {
            globalWaterDisplay = water.text!
        }
        if (checkPoint){
            waterHandler?(water.text)
            dismiss(animated: true, completion: nil)
        }
    }
    // Set Calorie Goal Button
    @IBAction func didTapSetCalorieGoalButton(_ sender: Any) {
        var checkPoint: Bool = true
        if (!calorieGoal.hasText){
            showAlert(titleInput: "Forgot Something?", messageInput: "No input for calorie goal (Cal)")
            checkPoint = false
        } else {
            globalCalGoal = calorieGoal.text!
            globalCalRemain = String(Int(globalCalGoal)! - Int(globalTotalCalDisplay)!)
        }
        if (checkPoint){
            calorieGoalHandler?(calorieGoal.text)
            calorieRemainHandler?(globalCalRemain)
            dismiss(animated: true, completion: nil)
        }
    }
    
    // Reset button
    @IBAction func didTapResetButton(_ sender: Any) {
        globalMealBreakfastName.removeAll()
        globalMealLunchName.removeAll()
        globalMealDinnerName.removeAll()
        globalMealSnackName.removeAll()
        globalMealBreakfastCal.removeAll()
        globalMealLunchCal.removeAll()
        globalMealDinnerCal.removeAll()
        globalMealSnackCal.removeAll()
        globalMealBreakfastCalDisplay = "0"
        globalMealLunchCalDisplay = "0"
        globalMealDinnerCalDispaly = "0"
        globalTotalCalDisplay = "0"
        globalWaterDisplay = "0"
        globalCalGoal = "0"
        globalCalRemain = "0"
        breakfastCalHandler?("0")
        lunchCalHandler?("0")
        dinnerCalHandler?("0")
        calorieHandler?("0")
        waterHandler?("0")
        calorieGoalHandler?("0")
        calorieRemainHandler?("0")
        dismiss(animated: true, completion: nil)
    }
    
    
    // Override function to dismiss number pad
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        calorie.resignFirstResponder()
        water.resignFirstResponder()
        calorieGoal.resignFirstResponder()
    }
}

// call keyboard
extension FoodDiaryFoodViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
