////
////  TaskAdder.swift
////  StudyRoom
////
////  Created by Max on 8/19/24.
////
//
//import Foundation
//import SwiftUI
//
//struct TaskAdder: View {
//    
//    @Environment(\.editMode) var editMode
//    @Environment(ModelData.self) var modelData
//    var draftTask: TaskModel
//    
//    var body: some View {
//        
//        ZStack() {
//            
//            TaskEditor(task: draftTask)
//                .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
//            
//            Button(action: saveTask, label: {
//                Text("Save")
//                    .padding()
//                    .font(.headline)
//            })
//            .buttonStyle(.bordered)
//            .buttonBorderShape(.roundedRectangle(radius: 15))
//            .tint(modelData.task.color)
//            .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing:  0))
//            
//        }
//        
//    }
//    
//    func saveTask() {
//        modelData.addTask(name: draftTask.name)
//    }
//    
//}
//
//#Preview {
//    TaskAdder()
//        .environment(ModelData())
//}
