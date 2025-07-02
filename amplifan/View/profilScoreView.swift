//
//  profilScoreView.swift
//  amplifan
//
//  Created by Philocles anais  on 30/06/2025.
//

import SwiftUI

struct profilScoreView: View {
    
    @EnvironmentObject var quizLogic: QuizLogic
    
    var body: some View {
        Text("Score: \(quizLogic.score)")
    }
}

