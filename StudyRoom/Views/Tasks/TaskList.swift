//
//  TaskList.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import SwiftUI

struct TaskList: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showInProgressOnly = false
    
    // filter for incomplete tasks
    var filteredTasks: [Task] {
        modelData.tasks.filter { task in
            (!showInProgressOnly || !task.isFinished )
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showInProgressOnly) {
                    Text("In Progress")
                }

                ForEach(filteredTasks) { task in
                    NavigationLink {
                        TaskHost()
                    } label: {
                        TaskRow(task: modelData.task)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .center))
                    }
                }
            }
            .navigationTitle("Tasks")
            .listStyle(.plain)
        } detail: {
            Text("List of Tasks")
        }
    }
    
    
}

#Preview {
    TaskList()
        .environment(ModelData())
}
