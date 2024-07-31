//
//  ContentView.swift
//  WeSplit
//
//  Created by Jason Cox on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    // @State signals the var is made here and only used here.
    @State var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    //                TextField("Enter your name", text: $name)
                    //                Button("Tap Count: \(tapCount)") {
                    //                    tapCount += 1
                    //                }
                    //                Text("Your name is \(name)")
                    //                ForEach(0..<100) { number in
                    //                    Text("Row \(number)")
                    //                }
                    // This does the same thing as above:
//                    ForEach(0..<4) {
//                        Text("Row \($0)")
//                    }
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .navigationTitle("Select a Student")
            }
        }
        
    }
}
#Preview {
    ContentView()
}
