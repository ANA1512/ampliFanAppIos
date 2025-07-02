//
//  SearchBarView.swift
//  amplifan
//
//  Created by Philocles anais  on 27/06/2025.
//

import SwiftUI

struct VideoCourse: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let date: String
    let imageName: String
}

let videosCourseArr = [
    VideoCourse(title: "La diffamation", author: "Henry Layson", date: "14/05/2025", imageName: "Guitar"),
    VideoCourse(title: "Le plagiat musical", author: "Sophie Bernard", date: "18/05/2025", imageName: "Piano"),
    VideoCourse(title: "Les droits d’auteur", author: "Julie Moreau", date: "21/05/2025", imageName: "Law"),
    VideoCourse(title: "Marketing éthique", author: "Théo Lambert", date: "23/05/2025", imageName: "Marketing"),
    VideoCourse(title: "Jouer à la flûte", author: "Laura Dufour", date: "22/05/2025", imageName: "Flute")
]



//view
//view searchbar
struct SearchBarView: View {
    @State private var searchText = ""
    
    //searchbar
    var filteredVideos: [VideoCourse] {
        if searchText.isEmpty {
            return videosCourseArr
        } else {
            return videosCourseArr.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
                || $0.author.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    //view list video
    var body: some View {
        NavigationStack {
            ZStack {
                
                //background
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple, Color.orange]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                       
                        
                        Text("Legal affairs")
                            .font(.system(size: 22, weight: .bold))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top, 5)
                            .padding(.horizontal)
                        
                        //video
                        ForEach(filteredVideos) { videoCourse in
                            HStack(alignment: .top, spacing: 16) {
                                Image(videoCourse.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 90, height: 90)
                                    .cornerRadius(10)
                                    .clipped()

                                VStack(alignment: .leading, spacing: 6) {
                                    Text(videoCourse.title)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text("par \(videoCourse.author)")
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.85))
                                    Text(videoCourse.date)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.7))
                                }

                                Spacer()
                            }
                            .frame(height: 120)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.ultraThinMaterial.opacity(0.5))
                            .cornerRadius(20)
                        }
                    }
                    .padding()
                }
            }
            .searchable(text: $searchText)
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}


#Preview {
    SearchBarView()
}
