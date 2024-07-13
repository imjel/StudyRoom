//
//  TaskEditor.swift
//  StudyRoom
//
//  Created by Max on 8/6/24.
//

import SwiftUI

struct TaskProgressLog: View {
    @Binding var task: Task
    
    var values: ClosedRange<Double> {
        0...task.goalTime
    }
    
    
    var body: some View {
        
        List {
            
            if (!task.isFinished){
                Button("Complete", systemImage: "square", action: finishTask)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 25))
                    .padding()
            } else {
                Button("Complete", systemImage: "checkmark.square", action: unfinishTask)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 25))
                    .padding()
            }
            
            
            VStack {
                Stepper("Log Minutes: \(Int(task.elapsedTime))", value: $task.elapsedTime, in: values)
                
                    .foregroundColor(Color.gray)
                    .font(.system(size: 25))
                    .padding()
                
            }
            
        }
    }
    
    func finishTask() {
        task.elapsedTime = task.goalTime
        task.isFinished = true
    }
    
    func unfinishTask() {
        task.elapsedTime = 0
        task.isFinished = false
    }
    
}

#Preview {
    TaskProgressLog(task: .constant(.default))
}
