//
//  EmptyTaskList.swift
//  StudyRoom
//
//  Created by Max on 8/29/24.
//

import SwiftUI

struct EmptyTaskList: View {
    var body: some View {
        
        VStack (alignment: .center) {
            NavigationLink (
                destination: TaskHost(editMode: .detailEditing),
                label: {
                    Image(systemName: "plus")
                        .font(.headline)
                        .foregroundColor(.blue)
                    Text ("Add Task")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                }
            )
            .padding(.top)
            Spacer()
            Text("No tasks to display")
                .foregroundColor(.gray)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    EmptyTaskList()
}
