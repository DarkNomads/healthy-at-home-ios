//
//  ProfileEditorViewController.swift
//  HealthyAtHome
//
//  Created by David Cao on 7/29/21.
//

import UIKit

class ProfileEditorViewController: UIViewController {

    @IBOutlet weak var profileInfoLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var heightFtTextField: UITextField!
    @IBOutlet weak var heightInTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var weightGoalTextField: UITextField!
    @IBOutlet weak var workoutGoalTextField: UITextField!
    @IBOutlet weak var weighInDayTextField: UITextField!
    @IBOutlet weak var sleepGoalTextField: UITextField!
    
    // Save profile data entry
    public var nameHandler: ((String?) -> Void)?
    public var heightHandler: ((String?) -> Void)?
    public var weightHandler: ((String?) -> Void)?
    public var weightGoalHandler: ((String?) -> Void)?
    public var workoutGoalHandler: ((String?) -> Void)?
    public var weighInDayHandler: ((String?) -> Void)?
    public var sleepGoalHandler: ((String?) -> Void)?
    
    @IBAction func saveProfile(_ sender: Any) {
        
        var completeHeight = ""
        if let heightFt = heightFtTextField.text {
            completeHeight.append(heightFt + "'")
        }
        if let heightIn = heightInTextField.text {
            completeHeight.append(heightIn)
        }
        
        heightHandler?(completeHeight)
        nameHandler?(nameTextField.text)
        weightHandler?(weightTextField.text)
        weightGoalHandler?(weightGoalTextField.text)
        workoutGoalHandler?(workoutGoalTextField.text)
        weighInDayHandler?(weighInDayTextField.text)
        sleepGoalHandler?(sleepGoalTextField.text)
        
        dismiss(animated: true, completion: nil)
    }
    
    let workoutGoals = ["Weight Loss", "Strength", "Stamina"]
    let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var workoutGoalPickerView = UIPickerView()
    var weighInDayPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workoutGoalPickerView.delegate = self
        workoutGoalPickerView.dataSource = self
        
        weighInDayPickerView.delegate = self
        weighInDayPickerView.dataSource = self
        
        workoutGoalTextField.inputView = workoutGoalPickerView
        workoutGoalTextField.textAlignment = .center
        
        weighInDayTextField.inputView = weighInDayPickerView
        weighInDayTextField.textAlignment = .center
        
    }
}

extension ProfileEditorViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == workoutGoalPickerView {
            return workoutGoals.count
        }
        else if pickerView == weighInDayPickerView {
            return daysOfWeek.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == workoutGoalPickerView {
            return workoutGoals[row]
        }
        else if pickerView == weighInDayPickerView {
            return daysOfWeek[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == workoutGoalPickerView {
            workoutGoalTextField.text = workoutGoals[row]
            workoutGoalTextField.resignFirstResponder()
        }
        else if pickerView == weighInDayPickerView {
            weighInDayTextField.text = daysOfWeek[row]
            weighInDayTextField.resignFirstResponder()
        }
    }
    
    // Function to dismiss textfields by tapping anywhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        heightFtTextField.resignFirstResponder()
        heightInTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
        weightGoalTextField.resignFirstResponder()
        workoutGoalTextField.resignFirstResponder()
        weighInDayTextField.resignFirstResponder()
        sleepGoalTextField.resignFirstResponder()
    }
}
