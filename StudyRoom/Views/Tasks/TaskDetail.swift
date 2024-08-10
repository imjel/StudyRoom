//
//  TaskDetail.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import SwiftUI

struct TaskDetail: View {

    @Environment(ModelData.self) var modelData
    @Binding var task: Task
    
    private let WIDTH: CGFloat = 280
    

    var progress: Double {
        guard task.goalTime > 0 else { return 0.0 } // if elapsedTime = 0
        return min(Double(task.elapsedTime) / Double(task.goalTime), 1.0) // get progress as percentage
    }
    
    var body: some View {
        
        Text(task.name + " " + task.icon.rawValue)
            .font(.system(size: 30))
            .bold()
        
        Divider()
        
        
        VStack(alignment: .leading) {
            
            
            HStack {
                Text(" \(String(format: "%.0f", task.elapsedTime)) / \(String(format: "%.0f", task.goalTime))")
                    .bold()
                    .foregroundStyle(task.color)
                Text("minutes completed")
            }
            
            TaskProgress(progress: progress, label: task.name, color: task.color)
            
            HStack {
                if (task.isFinished) {
                    Text("You did it!")
                } else {
                    Text("Only \(String(format: "%.0f", task.goalTime-task.elapsedTime))")
                        .bold()
                        .foregroundStyle(task.color)
                    
                    Text("minutes to go!")
                }
            }
        }
            
    }
}

#Preview {
    TaskDetail(task: .constant(Task.default))
        .environment(ModelData())
}
