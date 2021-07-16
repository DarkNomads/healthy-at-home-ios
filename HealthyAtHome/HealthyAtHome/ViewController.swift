//
//  ViewController.swift
//  HealthyAtHome
//
//  Created by David Cao on 7/6/21.
//

import UIKit
import SwiftUI

//Defult ViewController
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


// Sleep Tracker ----------------------------------------------------------------------
struct sleepTrackerView: View {
  var body: some View {
    
      VStack {
        Spacer()
          Text("Daily Sleep Goal:").font(.system(size: 26))
        HStack {
            Text("0").font(.system(size: 24))
            Text(" Hours").font(.system(size: 24))
        }
          
        Spacer()
        Spacer()
        Spacer()
      }
  }
}

class SleepTrackerHostingController: UIHostingController<sleepTrackerView> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: sleepTrackerView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
    }
}


// Profile ----------------------------------------------------------------------------------
struct profileView: View {
  var body: some View {
    
    Text("Profile").padding()
    
  }
}

class ProfileHostingController: UIHostingController<profileView> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: profileView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}


