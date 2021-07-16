//
//  ViewController.swift
//  HealthyAtHome
//
//  Created by David Cao on 7/6/21.
//

import UIKit
import SwiftUI
//import SwiftUICharts

//Defult ViewController
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


// Sleep Tracker ----------------------------------------------------------------------
class SleepTrackerViewController: UIViewController {
    
    let controller = UIHostingController(rootView: SleepTrackerChart())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        addChild(controller)
        view.addSubview(controller.view)
        
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        
//        self.addChild(controller)
//        self.view.addSubview(controller.view)
//        controller.didMove(toParent: self)
//
        NSLayoutConstraint.activate([
            controller.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            //controller.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
    }
}


