////
////  TaskList.swift
////  StudyRoom
////
////  Created by Max on 7/13/24.
////
//
//import SwiftUI
//
//struct TaskList: View {
//    @Environment(ModelData.self) var modelData
//    @State private var showInProgressOnly = false
//    
//    var filteredTasks: [Task] {
//        modelData.tasks.filter { task in
//            (!showInProgressOnly || task.isFinished )
//        }
//    }
//    
//    var body: some View {
//        Text("Hello")
//    }
//    
//    
//}
//
//#Preview {
//    TaskList()
//        .environment(ModelData())
//}
