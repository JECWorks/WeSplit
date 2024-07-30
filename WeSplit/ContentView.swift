//
//  ContentView.swift
//  WeSplit
//
//  Created by Jason Cox on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello, world!")
                }
                Text("Hello, world!")
                Text("Hello, world!")
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    ContentView()
}
