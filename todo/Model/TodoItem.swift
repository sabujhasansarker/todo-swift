//
//  Todo.swift
//  todo
//
//  Created by Sabuj on 21/7/26.
//
import SwiftUI

struct TodoItem: Identifiable{
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
    var date: Date
}
