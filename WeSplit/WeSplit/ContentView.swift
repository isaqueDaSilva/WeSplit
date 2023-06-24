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
    @FocusState private var isFoucused: Bool
    
    let percentages = [0, 0.10, 0.15, 0.20, 0.25]
    
    var totalPerPerson: Double {
        let tipValue = checkAmount * tipPercentage
        let grandTotal = checkAmount + tipValue
        return grandTotal / Double(numberOfPeoples)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($isFoucused)
                } header: {
                    Text("Amount:")
                }
                
                Section {
                    TextField("Numbers of people", value: $numberOfPeoples, format: .number)
                        .keyboardType(.numberPad)
                        .focused($isFoucused)
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
                Text("Total for people is: \(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    .listRowBackground(Color(CGColor(red: 240, green: 240, blue: 246, alpha: 0)))
                    .bold()
                    .foregroundColor(tipPercentage == 0 ? .red : .gray)
                    .frame(width: 300)
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isFoucused = false
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
