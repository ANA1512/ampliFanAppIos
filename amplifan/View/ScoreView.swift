//
//  ScoreView.swift
//  amplifan
//
//  Created by Philocles anais  on 26/06/2025.
//

import SwiftUI

struct ScoreView: View {
    let finalScore : Int
    let restart:() -> Void
    
    var body: some View {
        VStack {
            Text("your score is : \(finalScore)")
            Button("back to the quiz"){
               restart()
            }
        }
    }
}


