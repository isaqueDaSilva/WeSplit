//
//  ContentView.swift
//  WeSplit
//
//  Created by Isaque da Silva on 14/06/23.
//

import SwiftUI

extension Double {
    func percentage() -> Int {
        var percentage = self * 100
        return Int(percentage)
    }
}

struct ContentView: View {
    @State private var checkAmount: Double = 0
    @State private var numberOfPeoples: Int = 2
    @State private var tipPercentage: Double = 0.2
    
    let percentages = [0, 0.10, 0.15, 0.20, 0.25]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Aumont", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                    TextField("Numbers of people", value: $numberOfPeoples, format: .number)
                    
                    Picker("Select tip percentage", selection: $tipPercentage) {
                        ForEach(percentages, id: \.self) { percentage in
                            Text("\(percentage.percentage())%")
                        }
                    }
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
