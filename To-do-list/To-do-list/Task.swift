//
//  Task.swift
//  To-do-list
//
//  Created by Matt Despain on 11/2/24.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var dueDate: Date
    var isCompleted: Bool = false
}
