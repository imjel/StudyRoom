//
//  TaskEditor.swift
//  StudyRoom
//
//  Created by Max on 8/6/24.
//

import SwiftUI

struct TaskEditor: View {
    @Binding var task: TaskModel
    
    
    var body: some View {
        
        List {
            
            HStack {
                Text("Name")
                    .foregroundStyle(.primary)
                TextField("Name", text: $task.name)
                    .foregroundStyle(.blue)
                    .multilineTextAlignment(.trailing)
            }
            
            Picker("Icon", selection: $task.icon) {
                ForEach(TaskModel.Icon.allCases) { photo in
                    Text(photo.rawValue).tag(photo)
                }
            }
            
            HStack {
                Text("Elapsed Time")
                    .foregroundStyle(.primary)
                
            }
            
            HStack {
                Text("Color")
                Spacer()
                ColorPicker(selection: Binding (
                    get: {
                        Color(cgColor: task.savedColor.cgColor)
                    },
                    set: { newColor in
                        if let cgColor = newColor.cgColor {
                            task.savedColor = CodableColor(cgColor: cgColor)
                            }
                        }), supportsOpacity: false
                    ) { Text("") }
            }
            
            Toggle(isOn: $task.notifications) {
                Text("Enable Notifications")
            }
            
            VStack {
                HStack {
                    Text("Goal Time:")
                    Spacer()
                    Text("\(Int(task.goalTime)) min")
                        .foregroundStyle(.blue)
                        .multilineTextAlignment(.trailing)
                }
                
                Slider(value: $task.goalTime, in: 1...120, step: 1) {
                    Text("Goal Time")
                } minimumValueLabel: {
                    Text("1")
                } maximumValueLabel: {
                    Text("120")
                }
            
            }
        }
    }
    
}

#Preview {
    TaskEditor(task: .constant(.default))
}
