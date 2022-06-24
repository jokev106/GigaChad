//
//  BuddyGoalsApp.swift
//  BuddyGoals
//
//  Created by Jonathan Kevin on 24/06/22.
//

import SwiftUI

@main
struct BuddyGoalsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            GoalView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
