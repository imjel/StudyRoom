//
//  TaskHost.swift
//  StudyRoom
//
//  Created by Max on 8/6/24.
//

import SwiftUI

struct TaskHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftTask = Task.default
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        // cancelling edit resets the draftProfile to the currently saved profile
                        draftTask = modelData.task
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                TaskDetail(task: $draftTask)
            } else {
                TaskEditor(task: $draftTask)
                    // editor brings up current profile
                    .onAppear {
                        draftTask = modelData.task
                    }
                    // when editor is closed, changes from draftProfile are saved to data
                    .onDisappear {
                        modelData.task = draftTask
                    }
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    TaskHost()
        .environment(ModelData())
}

