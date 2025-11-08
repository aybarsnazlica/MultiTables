//
// SettingsView.swift
// MultiTables
// https://www.github.com/aybarsnazlica/MultiTables
// See LICENSE for license information.
//


import SwiftUI

struct SettingsView: View {
    @Binding var upperLimit: Int
    @Binding var questionCount: Int
    let multiplicationRange: ClosedRange<Int>
    let startGameAction: () -> Void
    
    var body: some View {
        Form {
            Section("Settings") {
                Stepper("Multiplication tables up to: \(upperLimit)x", value: $upperLimit, in: multiplicationRange)
                
                Picker("Number of questions", selection: $questionCount) {
                    ForEach(1..<21) { num in
                        Text("\(num)").tag(num)
                    }
                }
            }
            
            Button("Start Game") {
                startGameAction()
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}
