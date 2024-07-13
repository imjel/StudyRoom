//
//  Menu.swift
//  StudyRoom
//
//  Created by Max on 7/14/24.
//

import SwiftUI

struct Menu: View {
    @Environment(ModelData.self) var modelData
    @State private var toggleProfile = false
    
    var profile: Profile
    
    var body: some View {
        NavigationSplitView {
            Text ("Hello, \(profile.username)")
                .font(.title)
            List {
                
            }
            .toolbar {
                Button {
                    toggleProfile.toggle()
                } label: {
                    Label("Profile", systemImage: "person.circle")
                }
            }
            .sheet(isPresented: $toggleProfile) {
                ProfileHost()
                    .environment(modelData)
            }
            TaskHost()
        } detail: {
            Text ("My Tasks")
        }
    }
    
    
}

#Preview {
    Menu(profile: Profile.default)
        .environment(ModelData())
}

