//
//  SleepTrackerChart.swift
//  HealthyAtHome
//
//  Created by Youmin Zhou on 7/16/21.
//

import SwiftUI
import SwiftUICharts

struct SleepTrackerChart: View {
    var body: some View {
        //ScrollView {
            ZStack {
                Color(UIColor.systemIndigo)
                BarChartView(
                    data: ChartData(values: [
                                ("7/1", 8.55),
                                ("7/2", 7.93),
                                ("7/3", 8.26),
                                ("7/4", 8.35),
                                ("7/5", 6.93),
                                ("7/6", 7.82),
                                ("7/7", 7.26),
                                ("7/8", 9.13),
                                ("7/9", 8.35),
                                ("7/10", 8.54),
                                ("7/11", 8.75),
                            ])
                            ,title: "Sleep Hours", form: ChartForm.extraLarge
                )
                
            }
        //}
    }
}

struct SleepTrackerChart_Previews: PreviewProvider {
    static var previews: some View {
        SleepTrackerChart()
    }
}

//ScrollView {
//    VStack {
//        Spacer()
//        Text("Daily Sleep Goal:").font(.system(size: 26)).foregroundColor(Color.white)
//        HStack {
//            Text("0").font(.system(size: 24)).foregroundColor(Color.white)
//            Text(" Hours").font(.system(size: 24)).foregroundColor(Color.white)
//
//        }
//        Spacer()
//        BarChartView(
//            data: ChartData(values: [
//                ("7/1", 8.55),
//                ("7/2", 7.93),
//                ("7/3", 8.26),
//                ("7/4", 8.35),
//                ("7/5", 6.93),
//                ("7/6", 7.82),
//                ("7/7", 7.26),
//                ("7/8", 9.13),
//                ("7/9", 8.35),
//                ("7/10", 8.54),
//                ("7/11", 8.75),
//            ])
//            ,title: "Sleep Hours", form: ChartForm.extraLarge
//        )
//
//        Spacer()
//        Spacer()
//        Button("Edit Sleep Routine") {
//
//        }
//    }
//}
