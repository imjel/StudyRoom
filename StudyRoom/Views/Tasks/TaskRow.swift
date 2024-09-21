//
//  TaskRow.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import SwiftUI

struct TaskRow: View {

    var task: TaskModel
    var progress: Double {
        guard task.goalTime > 0 else { return 0.0 } // if elapsedTime = 0
        return min(Double(task.elapsedTime) / Double(task.goalTime), 1.0) // get progress as percentage
    }
    
    var body: some View {
        
        VStack {
            HStack (alignment: .center) {
                
                Image(systemName: task.isFinished ? "checkmark.square" : "square")
                    .foregroundColor(.gray)
                    .font(.system(size: 25))
                TaskProgress(progress: progress, label: task.name, color: task.color)

            }
        }
        
    }
}

#Preview {
    
    var item1 = TaskModel(name: "First task", isFinished: false)
    var item2 = TaskModel(name: "Second task", isFinished: true)

           Group {
               TaskRow(task: item1)
               TaskRow(task: item2)
           }
           
}
