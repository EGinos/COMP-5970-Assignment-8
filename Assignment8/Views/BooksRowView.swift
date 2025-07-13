//
//  BooksRowView.swift
//  Assignment8
//
//  Created by user276229 on 7/12/25.
//

import SwiftUI

struct BookRowView: View {
    let book: BookModel
    @EnvironmentObject private var favorites: FavoritesViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(book.bookTitle)
                    .font(.headline)
                Text(book.bookAuthor)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button {
                favorites.toggleFavoriteBook(book: book)
            } label: {
                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(book.isFavorite ? .red : .gray)
                    .imageScale(.large)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    BookRowView(book: sampleBooks[0])
        .environmentObject(FavoritesViewModel())
}
