//
//  DefaultView.swift
//  ChartsExercise
//
//  Created by Hyung Seo Han on 2023/01/21.
//

import SwiftUI
import Charts

struct DefaultView: View {
    let currentWeek: [StepCount] = [
        StepCount(day: "20220717", steps: 4200),
        StepCount(day: "20220718", steps: 15000),
        StepCount(day: "20220719", steps: 2800),
        StepCount(day: "20220720", steps: 10800),
        StepCount(day: "20220721", steps: 5300),
        StepCount(day: "20220722", steps: 10400),
        StepCount(day: "20220723", steps: 4000)
    ]
    
    var body: some View {
        VStack {
            GroupBox ("Bar Chart - Step Count"){
                Chart(currentWeek){
                    BarMark (x: .value("Week Day", $0.weekday, unit: .day),
                             y: .value("Step Count", $0.steps)
                    )
                }
            }
            .frame(height: 500)
            //차트를 맨 윗단으로 옮기기
            Spacer()
        }
        //차트 주변에 패딩값 부여
        .padding()
    }
}

struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView()
    }
}
