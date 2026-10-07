//
//  StocklyApp.swift
//  Stockly
//
//  Created by Timo Bruns on 07.10.26.
//

import SwiftUI
import SwiftData

@main
struct StocklyApp: App {
    private let sharedModelContainer: ModelContainer = {
        let schema = Schema(StocklySchema.models)
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
        }
        .modelContainer(sharedModelContainer)
    }
}
