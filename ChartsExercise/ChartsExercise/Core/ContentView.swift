//
//  ContentView.swift
//  ChartsExercise
//
//  Created by Hyung Seo Han on 2023/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack(){
            VStack{
                NavigationLink("Bar charts"){
                    BarChartsPage()
                }
            }
            .navigationTitle("Charts Exercise")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
