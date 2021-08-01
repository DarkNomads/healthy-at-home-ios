//
//  SleepTrackerChartViewController.swift
//  HealthyAtHome
//
//  Created by Youmin Zhou on 7/27/21.
//
import SwiftUI
import UIKit

class SleepTrackerChartViewController: UIViewController {
    
    fileprivate let sleepTrackerChartInHC = UIHostingController(rootView: SleepTrackerChart())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemIndigo
        
        setupHC()
        sleepTrackerChartInHC.view.translatesAutoresizingMaskIntoConstraints = false
        sleepTrackerChartInHC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        sleepTrackerChartInHC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        sleepTrackerChartInHC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        sleepTrackerChartInHC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    fileprivate func setupHC() {
        addChild(sleepTrackerChartInHC)
        view.addSubview(sleepTrackerChartInHC.view)
        sleepTrackerChartInHC.didMove(toParent: self)
    }
    
}
