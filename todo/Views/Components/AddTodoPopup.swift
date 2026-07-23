//
//  AddTodoPopup.swift
//  todo
//
//  Created by Sabuj on 21/7/26.
//

import SwiftUI

struct AddTodoPopup: View {
    @Binding var popup: Bool
    @Binding var tasks: [TodoItem]
    @State var title: String = ""
    @State var dueDate: Date = Date()
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Add Todo")
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                    Image(systemName: "multiply")
                        .foregroundColor(.gray)
                        .font(.system(size:20))
                        .onTapGesture {
                            popup = false
                        }
                }
                .padding(.bottom,20)
                
                VStack(alignment: .leading, spacing: 15){
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Task Title :")
                            .font(.body)
                            .fontWeight(.medium)
                        TextField("Task Title", text: $title)
                            .padding()
                            .background(Color(white: 0.95))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Due Date :")
                            .font(.body)
                            .fontWeight(.medium)
                        DatePicker("Due Date", selection: $dueDate,displayedComponents: [.date])
                            .datePickerStyle(.graphical).accentColor(.blue).padding(10)
                            .background(Color(white: 0.95))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    Button(
                        action: {
                            addTask()
                        }
                    )
                    {
                        Text("Add Task")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(title.isEmpty ? .gray : .white)
                            .font(.system(size: 16, weight: .medium))
                            .padding(14)
                            .background(title.isEmpty ? Color(white: 0.95) : Color(hex: "#00A89D"))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .disabled(title.isEmpty)
                }
                
            }
            .padding(20)
        }
    }
    func addTask() {
            let newTask = TodoItem(title: title, isCompleted: false, date: dueDate)
            tasks.append(newTask)
            popup = false
        }
}
