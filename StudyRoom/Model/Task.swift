//
//  Task.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import Foundation
import SwiftUI

struct Task {
    
//    var name: String
//    var elapsedTime: Double
//    var goalTime: Double
//    var isFinished: Bool
//    var isDaily: Bool
//    var icon = Icon.pencil
//    var notifications: Bool
//    var color: Color
    
    var name: String
    var elapsedTime = 0.0
    var goalTime = 10.0
    var isFinished = false
    var isDaily = true
    var icon = Icon.pencil
    var notifications = false
    var color = Color(.blue)
    
    static let `default` = Task(name: "study")
    
    
    enum Icon: String, CaseIterable, Identifiable {
        
        case books = "📚"
        case openBook = "📖"
        case pencil = "✏️"
        case coffee = "☕️"
        case palette = "🎨"
        
        var id: String {rawValue}
    }
    
    mutating func checkFinished() {
        if elapsedTime >= goalTime {
            self.isFinished = true;
        }
    }
    
}
