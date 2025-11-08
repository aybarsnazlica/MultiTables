//
// QuestionView.swift
// MultiTables
// https://www.github.com/aybarsnazlica/MultiTables
// See LICENSE for license information.
//


import SwiftUI

struct QuestionView: View {
    let question: Question
    let questionNumber: Int
    let totalQuestions: Int
    @Binding var userAnswer: Int
    let submitAction: () -> Void
    
    var body: some View {
        Form {
            Section("Question \(questionNumber) of \(totalQuestions)") {
                Text(question.text)
            }
            
            Section("Answer") {
                TextField("Answer", value: $userAnswer, format: .number)
                    .keyboardType(.numberPad)
                    .onSubmit {
                        submitAction()
                    }
            }
            
            Button("Submit") {
                submitAction()
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}
