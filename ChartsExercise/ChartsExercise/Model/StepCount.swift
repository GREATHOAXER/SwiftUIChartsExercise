//
//  StepCount.swift
//  ChartsExercise
//
//  Created by Hyung Seo Han on 2023/01/21.
//

import SwiftUI

struct StepCount: Identifiable {
    let id = UUID()
    let weekday: Date
    let steps: Int
    
    init(day: String, steps: Int){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        self.weekday = formatter.date(from: day) ?? Date.distantPast
        self.steps = steps
    }
    
    var weekdayString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: weekday)
    }
}

