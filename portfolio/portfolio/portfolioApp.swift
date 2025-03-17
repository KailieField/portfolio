//
//  portfolioApp.swift
//  portfolio
//
//  Created by Kailie Field on 2025-03-16.
//

import SwiftUI
import SwiftData

@main
struct portfolioApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)
        }
        .modelContainer(sharedModelContainer)
    }
}
