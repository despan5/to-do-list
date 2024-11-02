//
//  TaskViewModel.swift
//  To-do-list
//
//  Created by Matt Despain on 11/2/24.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var showingAddTaskView = false
    
    func addTask(title: String, dueDate: Date) {
        let newTask = Task(title: title, dueDate: dueDate)
        tasks.append(newTask)
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func toggleCompletion(of task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func clearCompletedTasks() {
        tasks.removeAll { $0.isCompleted }
    }
}
