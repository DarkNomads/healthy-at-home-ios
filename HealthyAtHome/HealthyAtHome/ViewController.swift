//
//  ViewController.swift
//  HealthyAtHome
//
//  Created by David Cao on 7/6/21.
//

import UIKit
import SwiftUI
import SwiftUICharts   //class for line chart

//Defult ViewController
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


// Sleep tracker view controller class
class SleepTrackerViewController: UIViewController {
    
    let contentView = UIHostingController(rootView: SleepTrackerView())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(contentView.view)
        
    
    }


}

// Profile view controller class
class ProfileViewController: UIViewController {
    
    let contentView = UIHostingController(rootView: ProfileView())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(contentView.view)
    }


}

