//
//  AddTaskView.swift
//  To-do-list
//
//  Created by Matt Despain on 11/2/24.
//


import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var taskViewModel: TaskViewModel
    @State private var title = ""
    @State private var dueDate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Title")) {
                    TextField("Enter task title", text: $title)
                }
                
                Section(header: Text("Due Date and Time")) {
                    DatePicker("Select due date and time", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                }
                
                Section {
                    Button("Add Task") {
                        taskViewModel.addTask(title: title, dueDate: dueDate)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("New Task")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
