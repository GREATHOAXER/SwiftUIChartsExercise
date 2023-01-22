//
//  ColorCustomView.swift
//  ChartsExercise
//
//  Created by Hyung Seo Han on 2023/01/22.
//

import SwiftUI
import Charts


struct ColorCustomView: View {
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
            GroupBox ( "Bar Chart - Step Count") {
                Chart(currentWeek) {
                    BarMark(
                        x: .value("Week Day", $0.weekday, unit: .day),
                        y: .value("Step Count", $0.steps)
                    )
                    .foregroundStyle(Color.orange)
                }
                .chartYAxis {
                    AxisMarks(position: .leading){ value in
                        AxisGridLine().foregroundStyle(.orange)
                    }
                }
                .chartXAxis {
                    AxisMarks (values: .stride (by: .day)) { value in
                        //X좌표를 나타낼때의 참고 자료(즉 세로줄)
                        AxisGridLine().foregroundStyle(.orange)
                        AxisValueLabel(format: .dateTime.weekday(),
                                       centered: true)
                    }
                }
            }
            .frame(height: 500)
            
            Spacer()
        }
        .padding()
    }
}
struct ColorCustomView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCustomView()
    }
}
