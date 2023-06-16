//
//  ContentView.swift
//  WeSplit
//
//  Created by Isaque da Silva on 14/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0
    @State private var numberOfPeoples: Int = 2
    @State private var tipPercentage: Double = 0.2
    
    let percentages = [0, 0.10, 0.15, 0.20, 0.25]
    
    var totalPerPerson: Double {
        let tipValue = checkAmount * tipPercentage
        let grandTotal = checkAmount + tipValue
        return grandTotal / Double(numberOfPeoples)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section{
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Amount:")
                    }
                    
                    Section {
                        TextField("Numbers of people", value: $numberOfPeoples, format: .number)
                            .keyboardType(.numberPad)
                    } header: {
                        Text("Numbers of peoples:")
                    }
                    
                    Section {
                        Picker("How much tip do you want to leave?", selection: $tipPercentage) {
                            ForEach(percentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                    } header: {
                        Text("Tip:")
                    }
                } .navigationTitle("WeSplit")
                Text("Total for people is: \(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    .bold()
                    .foregroundColor(.gray)
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
