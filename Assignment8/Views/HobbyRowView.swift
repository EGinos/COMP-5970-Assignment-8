//
//  HobbyRowView.swift
//  Assignment8
//
//  Created by user276229 on 7/12/25.
//

import SwiftUI

struct HobbyRowView: View {
    
    let hobby: HobbyModel
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        HStack {
            Text(hobby.hobbyIcon)
                .font(.title2)
            Text(hobby.hobbyName)
                .font(.body)
            
            Spacer()
            
            Button(action: {
                favorites.toggleFavoriteHobby(hobby: hobby)
            }) {
                Image(systemName: hobby.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(hobby.isFavorite ? .red : .gray)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    HobbyRowView(hobby: HobbyModel(id: 1, hobbyName: "Hiking", hobbyIcon: "🥾"))
}
