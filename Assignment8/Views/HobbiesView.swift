//
//  HobbiesView.swift
//  Assignment8
//
//  Created by user276229 on 7/12/25.
//

import SwiftUI

struct HobbiesView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    @Binding var searchText: String
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(favorites.filteredHobbies(searchText: searchText)) { hobby in
                    HobbyRowView(hobby: hobby)
                }
            }
            .padding()
        }
    }
}
