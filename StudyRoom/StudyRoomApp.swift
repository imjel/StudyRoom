//
//  StudyRoomApp.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import SwiftUI

@main
struct StudyRoomApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(modelData)
    }
}
