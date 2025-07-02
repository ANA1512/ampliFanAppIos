//
//  QuizView.swift
//  amplifan
//
//  Created by Philocles anais  on 26/06/2025.
//

import SwiftUI


struct QuizView: View {
    @EnvironmentObject  var quizLogic : QuizLogic
    @State private var showAlertIsCorrect = false
    
    var body: some View {
        
        ZStack{
            
            //background
            LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            
            //  condition finalScore end quiz
            if quizLogic.isQuizDone{
                ScoreView(finalScore: quizLogic.score, restart: {
                    quizLogic.reinitializeQuiz()})
            }else{
                
                //const get one question from array quiz[...]
                let currentQuestion = quiz[quizLogic.currentIndexQuestion]
                
                VStack(spacing: 20) {
                    
                    //slider
                    ProgressView(value: Double(quizLogic.currentIndexQuestion), total: Double(quiz.count))
                        .tint(.mint)
                    
                    
                    // Current question
                    Text(currentQuestion.question)
                        .font(.system(size:22, weight: .bold))
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 75/255, green: 46/255, blue: 131/255))
                        .padding(20)
                        .frame(minHeight: 140, maxHeight: 160)
                    
                    //color bg button(assets method)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color("gradientStart"),
                                    Color("gradientEnd")
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 1)
                    
                    //Display response
                    ForEach(currentQuestion.reponses) { reponse in
                        Button(action: {
                            quizLogic.checkreponse(reponse: reponse)
                            
                            //notification if correct answer
                            if reponse.isQuestionCorrect {
                                showAlertIsCorrect = true
                            }
                        }) {
                            Text(reponse.reponseQuestion)
                                .padding()
                                .foregroundColor(Color.white)
                                .font(.system(size: 19, weight: .regular))
                                .background(Color(red: 75/255, green: 46/255, blue: 131/255))
                                .cornerRadius(20)
                        }
                        .disabled(quizLogic.userClickToAnswer)
                    }
                    
                    // notification window
                    .alert("Bravo!", isPresented: $showAlertIsCorrect ) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text("correct answer !")
                    }
                    
                    // Score
                    Text("Score : \(quizLogic.score)")
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 30, weight: .bold))
                    
            
                    
                    //button
                    HStack {
                        
                        //button to reinitialize
                        Button(action: {
                            quizLogic.reinitializeQuiz()
                        }) {
                            Label("Replay", systemImage: "arrow.clockwise.circle")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        // Next button
                        Button(action: {
                            quizLogic.nextQuestion()
                        }) {
                            HStack{
                                Text("Next")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                Image(systemName: "arrowshape.forward")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            }
                        }
                        
                    }
                    .padding(20)
                }
                .padding()
            }
        }
    }
}


#Preview {
    QuizView()
        .environmentObject(QuizLogic())
}
