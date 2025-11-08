//
// ContentView.swift
// MultiTables
// https://www.github.com/aybarsnazlica/MultiTables
// See LICENSE for license information.
//

import SwiftUI

struct Question: Hashable {
    var text: String = "1 x 1"
    var result: Int = 1
}

enum GameState {
    case settings, active, results
}

struct ContentView: View {
    let multiplicationRange = 1...10
    
    @State private var gameState: GameState = .settings
    @State private var upperLimit: Int = 1
    @State private var questionCount: Int = 1
    @State private var currentQuestionIndex: Int = 0
    @State private var userAnswer: Int = 0
    @State private var questions = [Question]()
    @State private var score: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                switch gameState {
                case .settings:
                    SettingsView(
                        upperLimit: $upperLimit,
                        questionCount: $questionCount,
                        multiplicationRange: multiplicationRange,
                        startGameAction: startGame
                    )
                case .active:
                    if currentQuestionIndex < questions.count {
                        QuestionView(
                            question: questions[currentQuestionIndex],
                            questionNumber: currentQuestionIndex + 1,
                            totalQuestions: questionCount,
                            userAnswer: $userAnswer,
                            submitAction: submitAnswer
                        )
                    }
                case .results:
                    ResultsView(
                        score: score,
                        totalQuestions: questionCount,
                        playAgainAction: resetGame
                    )
                }
            }
            .navigationTitle("MultiTables")
            .padding()
        }
    }
    
    func generateQuestions() {
        var generatedQuestions = [Question]()
        var possiblePairs = [(Int, Int)]()
        
        for i in 1...upperLimit {
            for j in 1...10 {
                possiblePairs.append((i, j))
            }
        }
        
        possiblePairs.shuffle()
        
        for pair in possiblePairs.prefix(questionCount) {
            let questionText = "\(pair.0) x \(pair.1)"
            let result = pair.0 * pair.1
            generatedQuestions.append(Question(text: questionText, result: result))
        }
        
        questions = generatedQuestions
    }
    
    func startGame() {
        generateQuestions()
        currentQuestionIndex = 0
        score = 0
        userAnswer = 0
        gameState = .active
    }
    
    func submitAnswer() {
        if userAnswer == questions[currentQuestionIndex].result {
            score += 1
        }
        
        userAnswer = 0
        currentQuestionIndex += 1
        
        if currentQuestionIndex >= questionCount {
            gameState = .results
        }
    }
    
    func resetGame() {
        questions.removeAll()
        userAnswer = 0
        currentQuestionIndex = 0
        score = 0
        gameState = .settings
    }
}


#Preview {
    ContentView()
}
