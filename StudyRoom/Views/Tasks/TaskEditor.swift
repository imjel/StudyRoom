//
//  TaskEditor.swift
//  StudyRoom
//
//  Created by Max on 8/6/24.
//

import SwiftUI

struct TaskEditor: View {
    @Binding var task: Task
    
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
                ForEach(Task.Icon.allCases) { photo in
                    Text(photo.rawValue).tag(photo)
                }
            }
            HStack {
                Text("Color")
                Spacer()
                ColorPicker(selection: $task.color, supportsOpacity: false){
                }
            }
            
            Toggle(isOn: $task.notifications) {
                Text("Enable Notifications")
            }
            
        }
    }
    
}

#Preview {
    TaskEditor(task: .constant(.default))
}
