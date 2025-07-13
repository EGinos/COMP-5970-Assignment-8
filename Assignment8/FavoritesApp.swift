//
//  FavoritesApp.swift
//  Assignment8
//
//  Created by user276229 on 7/12/25.
//

import SwiftUI

@main
struct FavoritesApp: App {
    
    @StateObject private var favoritesViewModel = FavoritesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoritesViewModel)
        }
    }
}
