//
//  HorizontalCharts.swift
//  ChartsExercise
//
//  Created by Hyung Seo Han on 2023/01/22.
//

import SwiftUI
import Charts


struct HorizontalCharts: View {
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
                HStack{
                    VStack{
                        ForEach(0..<7, id: \.self){_ in
                            Spacer()
                            Text("Shibal")
                        }
                        Spacer()
                        
                    }
                    .frame(height:200)
                    .font(.caption2)
                   
                    Spacer()
                    Chart() {
                        ForEach(currentWeek) { week in
                            let steps = week.steps
                            BarMark(
                                x: .value("Step Count", week.steps),
                                y: .value("Week Day", week.weekday, unit: .day),
                                width: 15
                            )
                            .annotation(position: .overlay, alignment: .trailing, spacing: 20){
                                Spacer()
                                Text("\(steps)%")
                                    .font(.title3)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .chartXAxis(.hidden)
                    .chartYAxis {
                        AxisMarks (position: .trailing, values: .stride (by: .day)) { value in
                            AxisValueLabel(format: .dateTime.weekday(), centered: true)
                                .foregroundStyle(Color.red)
                                .font(.caption)
                        }
                        
                    }
                
                    .frame(width: 300, height: CGFloat(currentWeek.count*28), alignment: .leading)
                    .border(width: 1, edges: [.leading], color: .black)
                    
            }
            .padding()
        }
    }
}

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }

            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }

            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return width
                }
            }

            var h: CGFloat {
                switch edge {
                case .top, .bottom: return width
                case .leading, .trailing: return rect.height
                }
            }
            path.addRect(CGRect(x: x, y: y, width: w, height: h))
        }
        return path
    }
}

struct HorizontalCharts_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCharts()
    }
}
