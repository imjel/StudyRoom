//
//  NotificationTest.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
// https://medium.com/@jpmtech/your-complete-guide-to-push-notifications-in-swiftui-8a13f5588662

import SwiftUI
import UserNotifications

struct NotificationTest: View {
    let notificationCenter = UNUserNotificationCenter.current()
    
    var body: some View {
        VStack {
            Button("Request Notification Access") {
//                Task {
//                    do {
//                        try await notificationCenter.requestAuthorization(options: [.alert, .badge, .sound])
//                    } catch {
//                        print("Request authorization error")
//                    }
//                }
//            }
            // .buttonStyle(.bordered)
        }
    }
}

//#Preview {
//    NotificationTest()
}
