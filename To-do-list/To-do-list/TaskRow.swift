//
//  TaskRow.swift
//  To-do-list
//
//  Created by Matt Despain on 11/2/24.
//

import SwiftUI

struct TaskRow: View {
    let task: Task
    let toggleCompletion: () -> Void
    
    var body: some View {
        HStack {
            Button(action: toggleCompletion) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            VStack(alignment: .leading) {
                Text(task.title)
                    .strikethrough(task.isCompleted, color: .black)
                Text("Due: \(task.dueDate, style: .date)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
