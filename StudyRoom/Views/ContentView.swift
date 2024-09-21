//
//  ContentView.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .tasks
    @StateObject var modelData: ModelData = ModelData()
    @State private var toggleProfile = false
    
    enum Tab {
        case tasks
        case profile
        case calendar
        case timer
        case studyRoom
    }
    
    var body: some View {
        NavigationSplitView {
            Text("Hello, \(modelData.profile.username)")
                .font(.title)
            .toolbar {
                Button {
                    toggleProfile.toggle()
                } label: {
                    Label("Profile", systemImage: "person.circle")
                }
            }
            
            TabView(selection: $selection) {
                TaskList()
                    .tabItem {
                        Label("Tasks", systemImage: "list.bullet")
                    }
                    .tag(Tab.tasks)
                TimerView()
                    .tabItem {
                        Label("Clock", systemImage: "clock")
                    }
                    .tag(Tab.timer)
            }
            
        } detail: {
            Text ("My Tasks")
        }
        
        .sheet(isPresented: $toggleProfile) {
            ProfileHost()
                .environmentObject(modelData)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
