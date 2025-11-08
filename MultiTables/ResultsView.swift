//
// ResultsView.swift
// MultiTables
// https://www.github.com/aybarsnazlica/MultiTables
// See LICENSE for license information.
//


import SwiftUI


struct ResultsView: View {
    let score: Int
    let totalQuestions: Int
    let playAgainAction: () -> Void
    
    var body: some View {
        Form {
            Section("Summary") {
                Text("Correct: \(score) / \(totalQuestions)  Wrong: \(totalQuestions - score)")
            }
            
            Button("Play Again") {
                playAgainAction()
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}


