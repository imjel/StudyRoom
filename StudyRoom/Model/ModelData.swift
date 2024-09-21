//
//  ModelData.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import Foundation
import SwiftUI

class ModelData: ObservableObject {
    
    var profile = ProfileModel.default
    var task = TaskModel.default
    
    var tasks: [TaskModel] = [] {
        didSet {
            saveTask()
        }
    }
    
    let tasksKey: String = "tasks_list"
    
    init() {
        getTask()
    }
    
    func addTask(newTask: TaskModel) {
        tasks.append(newTask)
    }
    
    func getTask() {
        guard
            let data = UserDefaults.standard.data(forKey: tasksKey),
            let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data)
        else {return}
        self.tasks = savedTasks
    }
    
    func saveTask() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
    
    func deleteTask(indexSet: IndexSet) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                    tasks.remove(at: index)
                }
        //tasks.remove(atOffsets: indexSet)
    }
    
    func updateTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: {$0.id == task.id }) {
            tasks[index] = task.updateFinished()
        }
    }
    
//    func setProfile(profile: ProfileModel) {
//        self.profile = profile
//    }
 
}
