//
//  QuizView.swift
//  amplifan
//
//  Created by Philocles anais  on 26/06/2025.
//

import SwiftUI

struct QuizView: View {
    @StateObject var quizLogic = QuizLogic()
    
    var body: some View {
        
        //  condition finalScore end quiz
        if quizLogic.isQuizDone{
            ScoreView(finalScore: quizLogic.score, restart: {
                          quizLogic.reinitializeQuiz()})
        }else{
            //const get one question from array quiz[...]
            let currentQuestion = quiz[quizLogic.currentIndexQuestion]
            
            VStack(spacing: 20) {
                
                // Current question
                Text(currentQuestion.question)
                    .font(.headline)
                
                //Display response
                ForEach(currentQuestion.reponses) { reponse in
                    Button(action: {
                        quizLogic.checkreponse(reponse: reponse)
                    }) {
                        Text(reponse.reponseQuestion)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                    .disabled(quizLogic.useClickToAnswer)
                }
                
                // Next button
                Button("Question suivante") {
                    quizLogic.nextQuestion()
                }
                
                // Score
                Text("Score : \(quizLogic.score)")
                
                //slider
                ProgressView(value: Double(quizLogic.currentIndexQuestion), total: Double(quiz.count))
                
                //button to reinitialize
                Button("back"){
                    quizLogic.reinitializeQuiz()
                }
                
                
                
            }
            .padding()
        }
      }
    }
#Preview {
    QuizView()
}
