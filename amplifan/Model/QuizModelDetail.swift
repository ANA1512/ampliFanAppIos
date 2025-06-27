//
//  QuizModel.swift
//  amplifan
//
//  Created by Philocles anais  on 26/06/2025.
//

import SwiftUI

// Data modelisation
struct QuizDetail: Identifiable {
    
    var id = UUID()
    var theme : String
    var question : String
    var reponses : [Reponse]
    var point : Int
    
    
}

//struct reponse ( array )

struct Reponse :Identifiable{
    
   var id = UUID()
   var reponseQuestion : String
    var isQuestionCorrect : Bool
}


//array of question Quiz

var quiz = [
    
 // Question 1
 QuizDetail(
    theme: "juridique",
    question: "Qu'est-ce que la diffamation dans le domaine artistique ?",
    reponses: [
        Reponse(reponseQuestion: "C’est critiquer un artiste publiquement", isQuestionCorrect: false),
        Reponse(reponseQuestion: "C’est publier une fausse information qui porte atteinte à la réputation d’un artiste", isQuestionCorrect: true),
        Reponse(reponseQuestion: "C’est parodier une chanson célèbre", isQuestionCorrect: false)
    ],
    point: 20
),
 
 //question 2
 QuizDetail(
    theme: "juridique",
    question: "Quelle est la conséquence possible d'une diffamation envers un musicien ?",
    reponses: [
        Reponse(reponseQuestion: "Une récompense musicale peut être annulée", isQuestionCorrect: false),
        Reponse(reponseQuestion: "L’auteur de la diffamation peut être poursuivi en justice", isQuestionCorrect: true),
        Reponse(reponseQuestion: "Le musicien diffamé est interdit de publier de nouvelles chansons", isQuestionCorrect: false)
    ],
    point: 10
 ),
 
 //question 3
 
 QuizDetail(
    theme: "juridique",
    question: "Laquelle de ces situations peut être considérée comme de la diffamation ",
    reponses: [
        Reponse(reponseQuestion: "Un critique écrit que la musique est mauvaise", isQuestionCorrect: false),
        Reponse(reponseQuestion: "Quelqu’un affirme publiquement que le chanteur a volé une chanson sans preuve", isQuestionCorrect: true),
        Reponse(reponseQuestion: "Une parodie humoristique d’un clip", isQuestionCorrect: false)
    ],
    point: 30
 ),
 
 //question 4
 
 
 QuizDetail(
    theme: "juridique",
    question: "Qui peut porter plainte pour diffamation? ",
    reponses: [
        Reponse(reponseQuestion: "Un fan de l’artiste", isQuestionCorrect: false),
        Reponse(reponseQuestion: "L’artiste lui-même", isQuestionCorrect: true),
        Reponse(reponseQuestion: "Le public", isQuestionCorrect: false)
    ],
    point: 15
 ),
 
 //question 5
 
 QuizDetail(
    theme: "juridique",
    question: "Pour éviter la diffamation, que faut-il faire avant de publier une information sensible? ",
    reponses: [
        Reponse(reponseQuestion: "Demander à un fan s’il est d’accord", isQuestionCorrect: false),
        Reponse(reponseQuestion: "ce n’est que mon avis", isQuestionCorrect: false),
        Reponse(reponseQuestion: "Vérifier que l'information est vraie et prouvée", isQuestionCorrect: true)
    ],
    point: 40
 )
 

]
