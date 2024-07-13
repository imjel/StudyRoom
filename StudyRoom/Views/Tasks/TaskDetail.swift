//
//  TaskDetail.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import SwiftUI

struct TaskDetail: View {
    
    @State private var toggleLog = false
    @State private var toggleTimer = false
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
        
        Divider()
        
        // menu buttons
        VStack {
            
            // log progress button
            Button {
                toggleLog.toggle()
            } label: {
                Text("Log Progress")
                    .frame(width: WIDTH, height: 56)
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 15))
            .tint(task.color)
            
            // set timer transition button
            Button {
                toggleTimer.toggle()
            } label: {
                Text("Set Timer")
                    .frame(width: WIDTH, height: 56)
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 15))
            .tint(task.color)
        }
            .padding()
        
            .navigationTitle(task.name)
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $toggleLog) {
                TaskProgressLog(task: $task)
            }
    }
}

#Preview {
    TaskDetail(task: .constant(Task.default))
        .environment(ModelData())
}
