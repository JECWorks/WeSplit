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
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<10) {
                            Text("\($0) people")
                        }
                    }
//                    .pickerStyle(.navigationLink)
                }
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
        
    }
}
#Preview {
    ContentView()
}
