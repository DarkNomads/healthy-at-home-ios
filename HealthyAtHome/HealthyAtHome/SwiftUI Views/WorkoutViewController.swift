//
//  WorkoutViewController.swift
//  HealthyAtHome
//
//  Created by Sarah Ramsey on 8/6/21.
//

import UIKit

class WorkoutViewController: UIViewController {
    
    @IBOutlet weak var workoutName: UITextField!
    @IBOutlet weak var minutes: UITextField!
    @IBOutlet weak var caloriesBurned: UITextField!
    @IBOutlet weak var selectSlider: UISlider!
    @IBOutlet weak var setWorkout: UIButton!
    @IBOutlet weak var warmupGoal: UITextField!
    @IBOutlet weak var workoutGoal: UITextField!
    @IBOutlet weak var cooldownGoal: UITextField!
    @IBOutlet weak var setWorkoutGoal: UIButton!
    @IBOutlet weak var setCoolDownGoal: UIButton!
    @IBOutlet weak var setWarmupGoal: UIButton!
    
    public var warmupCalHandler:((String?) -> Void)?
    public var warmupTimeHandler:((String?) -> Void)?
    public var workoutCalHandler:((String?) -> Void)?
    public var workoutTimeHandler:((String?) -> Void)?
    public var cooldownCalHandler:((String?) -> Void)?
    public var cooldownTimeHandler:((String?) -> Void)?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
    }
    
    // Slider amounts
    
    @IBAction func changeTip(_ sender: UISlider) {
        selectSlider.value = roundf(selectSlider.value)
    }
    
    // Set workout button
    
    @IBAction func didTapSetWorkout(_ sender: Any) {
        // var checkPoint: Bool = true
    }
    
    /*    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
