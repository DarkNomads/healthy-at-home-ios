//
//  ExerciseTracker.swift
//  HealthyAtHome
//
//  Created by Sarah Ramsey on 7/17/21.
//

import SwiftUI
import SwiftUICharts

struct ExerciseTracker: View {
    var body: some View {
        //ScrollView {
            ZStack {
                Color(UIColor.systemIndigo)
                ScrollView{
                    VStack(alignment: .leading, spacing: 10) {
                        // want to center in page
                        Text("Today's Exercise Plan").padding(25).font(.system(size: 15, weight: .heavy, design: .default))
                        // figure out how to add border along group of text
                        Text("Warmup:").padding(25).font(.system(size: 15, weight: .medium, design: .default))
                        // add checked text children to workout
                        Text("Workout:").padding(25).font(.system(size: 15, weight: .medium, design: .default))
                        Text("Cooldown:").padding(25).font(.system(size: 15, weight: .medium, design: .default))
                        // will make into button
                        Text("Edit Workout:").padding(25).border(Color.black, width: 5).font(.system(size: 15, weight: .heavy, design: .default))
                        
                    
                    }
                }
            }
        //}
    }
}

struct ExerciseTracker_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTracker()
    }
}
