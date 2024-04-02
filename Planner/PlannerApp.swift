//
//  PlannerApp.swift
//  Planner
//
//  Created by Joshua Cao on 2/26/24.
//

import SwiftUI

@main
struct PlannerApp: App {
    // Initialize the notification center
    let notificationCenter = UNUserNotificationCenter.current()

    var body: some Scene {
        WindowGroup {
            ContentView()
                // Request authorization when the app starts
                .onAppear {
                    requestNotificationAuthorization()
                }
        }
    }

    func requestNotificationAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            }
            if granted {
                print("Notification authorization granted")
            } else {
                print("Notification authorization denied")
            }
        }
    }

    init() {
        // Set the delegate for notification handling
        notificationCenter.delegate = NotificationDelegate()
    }
}

// Notification delegate to handle notifications
class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    // Handle notifications when the app is in the foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }

    // Handle notification actions
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Handle the notification action here
        completionHandler()
    }
}
