//
//  QuizLogic.swift
//  amplifan
//
//  Created by Philocles anais  on 26/06/2025.
//

import SwiftUI

class QuizLogic: ObservableObject {
    
    
        //variables (question ask, score, checkstatus)
    
        @Published var currentIndexQuestion : Int = 0
        @Published var score : Int = 0
        @Published var isQuizDone : Bool = false
        var allQuestionQuiz = quiz.count
        @Published var useClickToAnswer :Bool = false;
        
        //function ( checkreponse , nextquestion)
        func checkreponse(reponse :Reponse){
            if (reponse.isQuestionCorrect) {
                score += quiz[currentIndexQuestion].point
                print("correct")
            }
            useClickToAnswer = true
            }
          
        
        // function to go the next question
        func nextQuestion() {
            if currentIndexQuestion + 1 < quiz.count {
                currentIndexQuestion += 1
                useClickToAnswer = false
            } else{
                isQuizDone = true
                }
            }
            
        //function to reinitialize the quiz
        func reinitializeQuiz(){
            currentIndexQuestion = 0
            score = 0
            isQuizDone = false
            useClickToAnswer = false
            
        }
        
    
        
        
    
}


