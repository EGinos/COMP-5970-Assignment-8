//
//  FavoritesView.swift
//  Assignment8
//
//  Created by user276229 on 7/12/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: FavoritesViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Cities Section
                    if favorites.cities.contains(where: { $0.isFavorite }) {
                        SectionHeader("Cities")
                        LazyVStack(spacing: 12) {
                            ForEach(favorites.cities.filter { $0.isFavorite }) { city in
                                CityCardView(city: city)
                            }
                        }
                    }

                    // Hobbies Section
                    if favorites.hobbies.contains(where: { $0.isFavorite }) {
                        SectionHeader("Hobbies")
                        LazyVStack(spacing: 12) {
                            ForEach(favorites.hobbies.filter { $0.isFavorite }) { hobby in
                                HobbyRowView(hobby: hobby)
                            }
                        }
                    }

                    // Books Section
                    if favorites.books.contains(where: { $0.isFavorite }) {
                        SectionHeader("Books")
                        LazyVStack(spacing: 12) {
                            ForEach(favorites.books.filter { $0.isFavorite }) { book in
                                BookRowView(book: book)
                            }
                        }
                    }

                    // Empty State
                    if !favorites.cities.contains(where: { $0.isFavorite })
                        && !favorites.hobbies.contains(where: { $0.isFavorite })
                        && !favorites.books.contains(where: { $0.isFavorite }) {
                        Text("No favorites yet")
                            .foregroundColor(.secondary)
                            .padding(.top, 50)
                    }
                }
                .padding()
            }
            .navigationTitle("Favorites")
        }
    }
}

private struct SectionHeader: View {
    let title: String
    init(_ title: String) { self.title = title }
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}

