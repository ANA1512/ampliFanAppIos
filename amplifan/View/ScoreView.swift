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
                
                Image("trophy")
                    .resizable()
                    .scaledToFit()
                     .frame(width: 150, height: 150)
                    .padding(.top, 10)
                
                //display score
                Text("Your score is : \(finalScore)")
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 25, weight: .bold))
                
                    .padding(20)
                
                
                //button
                Button(action: {
                    restart()
                }) {
                    Label("Replay", systemImage: "arrow.clockwise.circle")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                
            }
    }
}

#Preview {
    ScoreView(finalScore: 30, restart:{})
}
