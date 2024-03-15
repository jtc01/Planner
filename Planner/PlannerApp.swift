//
//  PlannerApp.swift
//  Planner
//
//  Created by Joshua Cao on 2/26/24.
//

import SwiftUI

@main
struct PlannerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(tasks: Task.sampleData, selectedID: 0)
        }
    }
}
