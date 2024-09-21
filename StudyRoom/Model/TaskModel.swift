//
//  Task.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import Foundation
import SwiftUI
import UIKit

struct TaskModel: Identifiable, Codable {
    
    let id: String
    var name: String
    var elapsedTime = 0.0
    var goalTime = 10.0
    var isFinished = false
    var icon = Icon.pencil
    var notifications = false
    var savedColor = CodableColor(cgColor: UIColor.systemBlue.cgColor)
    
    var color: Color {
            savedColor.color
        }
    
    init(id: String = UUID().uuidString, name: String, isFinished: Bool) {
        self.id = id
        self.name = name
        self.isFinished = isFinished
    }
    
    static let `default` = TaskModel(
            id: UUID().uuidString,
            name: "Study",
            isFinished: false
        )
    
    enum Icon: String, CaseIterable, Identifiable, Codable {
        
        case books = "📚"
        case openBook = "📖"
        case pencil = "✏️"
        case coffee = "☕️"
        case palette = "🎨"
        
        var id: String {rawValue}
    }
    
    mutating func doFinished() {
        self.elapsedTime = goalTime
        self.isFinished = true
    }
    
    func updateFinished() -> TaskModel {
        return TaskModel(id: id, name: name, isFinished: !isFinished)
    }
    
}
