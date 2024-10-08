//
//  TaskHost2.swift
//  StudyRoom
//
//  Created by Max on 8/13/24.
//

import SwiftUI

struct TaskHost: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var draftTask = TaskModel.default
    @State var editMode: TaskEditMode = .none
    private let WIDTH: CGFloat = 280
    
    var isNewTask: Bool = false
    
    enum TaskEditMode {
        case none
        case detailEditing
        case progressLogging
        case timeLogging
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            if editMode == .none {
                Button("Edit") {
                    withAnimation {
                        editMode = .detailEditing
                    }
                }
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }
            
            HStack {
                if editMode != .none {
                    Button("Cancel", role: .cancel) {
                        withAnimation {
                            draftTask = modelData.task
                            editMode = .none
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button("Done") {
                        withAnimation {
                            if isNewTask {
                                modelData.addTask(newTask: draftTask)
                            } else {
                                modelData.task = draftTask
                            }
                            editMode = .none
                        }
                    }
                    .padding()
                }
            }
            
            // Default state; without editing menus
            
            if editMode == .none {
                TaskDetail(task: $draftTask)
                    .onAppear {
                        draftTask = modelData.task
                    }
                
            } else if editMode == .detailEditing {
                TaskEditor(task: $draftTask)
                    .onAppear {
                        draftTask = modelData.task
                    }
                    .onDisappear {
                        if !isNewTask {
                            modelData.task = draftTask
                        }
                        editMode = .none
                    }
            
            } else if editMode == .progressLogging {
                TaskProgressLog(task: $draftTask)
                    .onDisappear {
                        if !isNewTask {
                            modelData.task = draftTask
                        }
                        editMode = .none
                    }
            } else if editMode == .timeLogging {
                TimerView()
            }
            
            if editMode == .none {
                Divider()
                
                // log progress button
                Button {
                    withAnimation {
                        editMode = .progressLogging
                    }
                } label: {
                    Text("Log Progress")
                        .frame(width: WIDTH, height: 56)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle(radius: 15))
                .tint(modelData.task.color)
                
                // timer/stopwatch button
                Button {
                    withAnimation {
                        editMode = .timeLogging
                    }
                } label: {
                    Text("Set Timer")
                        .frame(width: WIDTH, height: 56)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle(radius: 15))
                .tint(modelData.task.color)
            }
            
        }
        Spacer()
    }
            
}
    
    #Preview {
        TaskHost()
            .environmentObject(ModelData())
    }

