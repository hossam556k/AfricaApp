//
//  AfricaApp.swift
//  Africa
//
//  Created by MacBook Pro on 22/10/2026.
//

import SwiftUI
import CoreData

@main
struct AfricaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
