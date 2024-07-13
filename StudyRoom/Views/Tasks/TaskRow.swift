//
//  TaskRow.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import SwiftUI

struct TaskRow: View {
    var task: Task
    var progress: Double {
        guard task.goalTime > 0 else { return 0.0 } // if elapsedTime = 0
        return min(Double(task.elapsedTime) / Double(task.goalTime), 1.0) // get progress as percentage
    }
    
    var body: some View {
        HStack (alignment: .center){
            if task.isFinished {
                Image(systemName: "checkmark.square")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 30))
            } else {
                Image(systemName: "square")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 30))
            }
            
            TaskProgress(progress: progress, label: task.name, color: task.color)

        }
    }
}

#Preview {
    TaskRow(task: Task.default)
}
