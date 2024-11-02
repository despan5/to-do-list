//
//  ContentView.swift
//  To-do-list
//
//  Created by Matt Despain on 11/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var taskViewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(taskViewModel.tasks) { task in
                    TaskRow(task: task, toggleCompletion: {
                        taskViewModel.toggleCompletion(of: task)
                    })
                }
                .onDelete(perform: taskViewModel.deleteTask)
            }
            .navigationTitle("To-Do List")
            .navigationBarItems(
                leading: Button("Clear Completed") {
                    taskViewModel.clearCompletedTasks()
                },
                trailing: Button(action: {
                    taskViewModel.showingAddTaskView.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $taskViewModel.showingAddTaskView) {
                AddTaskView(taskViewModel: taskViewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
