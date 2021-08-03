//
//  SleepTrackerChart.swift
//  HealthyAtHome
//
//  Created by Youmin Zhou on 7/16/21.
//

import SwiftUI
import SwiftUICharts


let chartStyle = ChartStyle(backgroundColor: Color(UIColor.systemIndigo), accentColor: Colors.OrangeStart, gradientColor: GradientColors.orange, textColor: Color.black, legendTextColor: Color.gray, dropShadowColor: Color.gray)

struct SleepTrackerChart: View {
    var body: some View {
            ZStack {
                Color(UIColor.systemIndigo)
                LineView(data: globalSleepData, title: "Sleep Data", legend: "Hours", style: chartStyle).padding()
            }
    }
}

struct SleepTrackerChart_Previews: PreviewProvider {
    static var previews: some View {
        SleepTrackerChart()
    }
}
