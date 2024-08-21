//
//  ContentView.swift
//  WeSplit
//
//  Created by Jason Cox on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    // @State signals the var is made here and only used here.
    // $ before the variable makes it two-way binding
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    @State private var noTip = false
    
    var grandTotal2: Double {
        // calculate the grandTotal
        let tS = Double(tipPercentage)
        let tA = Double(checkAmount / 100 * tS)
        let gT = Double(checkAmount + tA)
        
        return gT
    }
        
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("Total Check Amount"){
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<10) {
                            Text("\($0) people")
                        }
                    }
//                    .pickerStyle(.navigationLink)
                }
                
                Section ("Tip percentage"){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
//                    .pickerStyle(.segmented)
                    .pickerStyle(.wheel)
                    
                    Text("Total including tip: \(grandTotal2, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                }
                
                Section ("Total for each person:") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(tipPercentage == 0 ? .red: .primary)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        
    }
}
#Preview {
    ContentView()
}
