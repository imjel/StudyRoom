//
//  TaskList.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import SwiftUI

struct TaskList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        
        ZStack {
            
            if modelData.tasks.isEmpty {
                EmptyTaskList()
                
            } else {
                NavigationSplitView {
                    List {
                        ForEach(modelData.tasks) { task in
                            NavigationLink {
                                TaskHost()
                            } label: {
                                TaskRow(task: task)
                                    .onTapGesture {
                                        modelData.updateTask(task: task)
                                    }
                                }
                            }
                        .onDelete(perform: modelData.deleteTask)
                        }
                    .listStyle(.plain)
                } detail: {
                    Text("Select a task for details")
                }
            }
                

        }
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add Task", destination: TaskHost(editMode: .detailEditing, isNewTask: true))
            )
    }
}


#Preview {
    NavigationView {
                TaskList()
            }
            .environmentObject(ModelData())
        }
