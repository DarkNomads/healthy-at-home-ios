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
    
    
    public var sleepDataHourHandler:((String?) -> Void)?
    public var sleepDataMinuteHandler:((String?) -> Void)?
    public var wakeUpHandler:((String?) -> Void)?
    public var bedTimeHandler:((String?) -> Void)?
    public var thrower:((String?) -> Void)?
    
    //public var passSleepDataHandler:((Int?) -> Void)?

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
        alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: {action in
            print("Tapped Dismiss")
        }))
        present(alert, animated: true)
    }

    @IBAction func didTapSetSleepDataButton(_ sender: Any) {
        // Input check
        var flag: Bool = true
        var counterFlag1: Bool = true
        var counterFlag2: Bool = true
        if (sleepHours.hasText) {
            let tempH:Int? = Int(sleepHours.text!)
            if (tempH! > 23 || tempH! < 0){
                showAlert(titleInput: "Incorrect Hour", messageInput: "The Hour input is too large or too small")
                flag = false
            } else {
                flag = true
                counterFlag1 = true
            }
        } else {
            sleepDataMinuteHandler?("0")
            counterFlag1 = false
        }
        if (sleepMinutes.hasText) {
            let tempM:Int? = Int(sleepMinutes.text!)
            if(tempM! > 59 || tempM! < 0) {
                showAlert(titleInput: "Incorrect Minute", messageInput: "Minute input is too large or too small")
                flag = false
            } else {
                flag = true
                counterFlag2 = true
            }
        } else {
            sleepDataMinuteHandler?("0")
            counterFlag2 = false
        }
        
        if (flag){
            sleepDataHourHandler?(sleepHours.text)
            sleepDataMinuteHandler?(sleepMinutes.text)
            if (counterFlag1 || counterFlag2){
                thrower?("T")
            }
            dismiss(animated: true, completion: nil)
        } else {
            thrower?("F")
        }
    }
            
            
    @IBAction func didTapSetWakeButton(_ sender: Any) {
        // Input check
        var flag: Bool = true
        if (wakeUp.hasText) {
            let temp:Int? = Int(wakeUp.text!)
            if (temp! > 12 || temp! < 0){
                showAlert(titleInput: "Incorrect Time", messageInput: "The Time input is too large or too small")
                flag = false
            } else {
                flag = true
            }
        } else {
            wakeUpHandler?("0")
        }
        if (flag) {
            wakeUpHandler?(wakeUp.text!)
            dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func didTapSetBedButton(_ sender: Any) {
        // Input check
        var flag: Bool = true
        if (bedTime.hasText) {
            let temp:Int? = Int(bedTime.text!)
            if (temp! > 12 || temp! < 0){
                showAlert(titleInput: "Incorrect Time", messageInput: "The Time input is too large or too small")
                flag = false
            } else {
                flag = true
            }
        } else {
            bedTimeHandler?("0")
        }
        if (flag) {
            bedTimeHandler?(bedTime.text!)
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sleepHours.resignFirstResponder()
        sleepMinutes.resignFirstResponder()
        wakeUp.resignFirstResponder()
        bedTime.resignFirstResponder()
    }
    
}



extension SleepTrackerSettingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
