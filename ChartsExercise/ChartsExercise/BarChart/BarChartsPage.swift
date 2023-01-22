//
//  BarChartsPage.swift
//  ChartsExercise
//
//  Created by Hyung Seo Han on 2023/01/21.
//

import SwiftUI

struct BarChartsPage: View {
    var body: some View {
        VStack {
            NavigationLink("Default"){
                DefaultView()
            }
            NavigationLink("Color"){
                ColorCustomView()
            }
            
        }
    }
}

struct BarChartsPage_Previews: PreviewProvider {
    static var previews: some View {
        BarChartsPage()
    }
}
