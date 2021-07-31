//
//  SleepTrackerSettingViewController.swift
//  HealthyAtHome
//
//  Created by Youmin Zhou on 7/27/21.
//

import UIKit

class SleepTrackerSettingViewController: UIViewController {
    
    @IBOutlet weak var sleepHours: UITextField!
    @IBOutlet weak var sleepMinutes: UITextField!
    @IBOutlet weak var setSleepButton: UIButton!
    
    @IBOutlet weak var wakeUp: UITextField!
    @IBOutlet weak var setWakeButton: UIButton!
    @IBOutlet weak var bedTime: UITextField!
    @IBOutlet weak var setBedButton: UIButton!
    
    public var wakeUpHandler:((String?) -> Void)?
    public var bedTimeHandler:((String?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemIndigo
        sleepHours.delegate = self
        sleepMinutes.delegate = self
        wakeUp.delegate = self
        bedTime.delegate = self
        
        sleepHours.layer.cornerRadius = 10
        sleepMinutes.layer.cornerRadius = 10
        wakeUp.layer.cornerRadius = 10
        bedTime.layer.cornerRadius = 10
        setSleepButton.layer.cornerRadius = 10
        setWakeButton.layer.cornerRadius = 10
        setBedButton.layer.cornerRadius = 10
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else{
            return false
        }
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        return updateText.count < 3
    }
    
    func showAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: {action in
            print("Tapped Dismiss")
        }))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func didTapSetSleepDataButton(_ sender: Any) {

        var sleepDataTemp: Double = 0
        var tempHours: Int = 0
        var tempMinutes: Int = 0
        var checkPointHour: Bool = true
        var checkPointMinute: Bool = true
        
        // Input check
        if (sleepHours.hasText) {
            let tempH:Int? = Int(sleepHours.text!)
            tempHours = tempH!
            if (tempH! > 23 || tempH! < 0){
                showAlert(titleInput: "Incorrect Hour", messageInput: "The Hour input is too large or too small")
                checkPointHour = false
            } else {
                globalSleepDataHours = sleepHours.text
                checkPointHour = true
            }
        } else {
            tempHours = 0
            checkPointHour = true
        }
        if (sleepMinutes.hasText) {
            let tempM:Int? = Int(sleepMinutes.text!)
            tempMinutes = tempM!
            if(tempM! > 59 || tempM! < 0) {
                showAlert(titleInput: "Incorrect Minute", messageInput: "Minute input is too large or too small")
                checkPointMinute = false
            } else {
                globalSleepDataMinutes = sleepMinutes.text
                checkPointMinute = true
            }
        } else {
            tempMinutes = 0
            checkPointMinute = true
        }
        if (tempHours == 0 && tempMinutes == 0) {
            dismiss(animated: true, completion: nil)
        } else {
            if (checkPointHour && checkPointMinute){
                sleepDataTemp = Double(tempHours) + (Double(tempMinutes) / 60)
                globalSleepData.append(sleepDataTemp)
                globalWeeklyAverageHours.append(tempHours)
                globalWeeklyAverageMinutes.append(tempMinutes)
                dismiss(animated: true, completion: nil)
            }
        }
    }
            
            
    @IBAction func didTapSetWakeButton(_ sender: Any) {
        // Input check
        if (wakeUp.hasText) {
            let temp:Int? = Int(wakeUp.text!)
            if (temp! > 12 || temp! < 0){
                showAlert(titleInput: "Incorrect Time", messageInput: "The Time input is too large or too small")
            } else {
                globalWakeUpTime = wakeUp.text
                dismiss(animated: true, completion: nil)
            }
        } else {
            globalWakeUpTime = "0"
            dismiss(animated: true, completion: nil)
        }
        wakeUpHandler?(wakeUp.text!)
    }
    @IBAction func didTapSetBedButton(_ sender: Any) {
        // Input check
        if (bedTime.hasText) {
            let temp:Int? = Int(bedTime.text!)
            if (temp! > 12 || temp! < 0){
                showAlert(titleInput: "Incorrect Time", messageInput: "The Time input is too large or too small")
            } else {
                globalBedTime = bedTime.text
                dismiss(animated: true, completion: nil)
            }
        } else {
            globalBedTime = "0"
            dismiss(animated: true, completion: nil)
        }
        bedTimeHandler?(bedTime.text!)
    }
    
    // Override function to dismiss number pad
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sleepHours.resignFirstResponder()
        sleepMinutes.resignFirstResponder()
        wakeUp.resignFirstResponder()
        bedTime.resignFirstResponder()
    }
    
}


// call keyboard
extension SleepTrackerSettingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
