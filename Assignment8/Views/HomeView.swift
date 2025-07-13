//
//  HomeView.swift
//  Assignment8
//
//  Created by user276229 on 7/12/25.
//

import SwiftUI

enum ContentCategory : String, CaseIterable {
    case cities = "Cities"
    case hobbies = "Hobbies"
    case books = "Books"
    
}

struct HomeView: View {
    
    @State private var selectedCategory: ContentCategory = .cities
    @State private var searchText: String = ""
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Categories", selection: $selectedCategory) {
                    ForEach(ContentCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                selectedContentView()
            }
            .navigationTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search \(selectedCategory.rawValue)")
        }
    }
    
    private func selectedContentView() -> some View {
        switch selectedCategory {
        case .cities:
            AnyView(CitiesView(searchText: $searchText))
        case .hobbies:
            AnyView(HobbiesView(searchText: $searchText))
        case .books:
            AnyView(BooksView(searchText: $searchText))
        }
    }

    
}

#Preview {
    HomeView()
        .environmentObject(FavoritesViewModel())
}
