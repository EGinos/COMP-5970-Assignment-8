//
//  SettingsView.swift
//  Assignment8
//
//  Created by user276229 on 7/12/25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @EnvironmentObject private var favoritesViewModel: FavoritesViewModel
    @State private var showResetAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header : Text("Appearance")) {
                    Toggle(isOn: $isDarkMode) {
                        Label("Dark Mode", systemImage: "moon.fill")
                    }
                }
                Section {
                    Button(role: .destructive) {
                        showResetAlert = true
                    } label: {
                        Label("Clear All Favorites", systemImage: "trash")
                    }
                }
                .alert("Are you sure you want to clear all favorites?", isPresented: $showResetAlert) {
                    Button("Clear", role: .destructive) {
                        favoritesViewModel.clearAllFavorites()
                    }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("All favorites will be deleted.")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(FavoritesViewModel())
}
