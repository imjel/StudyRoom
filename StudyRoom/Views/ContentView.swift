//
//  ContentView.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import SwiftUI
// import UserNotifications

struct ContentView: View {
    @State private var selection: Tab = .tasks
//    let notificationCenter = UNUserNotificationCenter.current()
    
    enum Tab {
        case tasks
        case profile
        case calendar
        case timer
        case studyRoom
    }
    
    var body: some View {
        TabView(selection: $selection) {
////            TaskList()
//                .tabItem {
//                    Label("Tasks", systemImage: "list.bullet")
//                }
//                .tag(Tab.tasks)
        }
    }
}

#Preview {
    ContentView()
}
