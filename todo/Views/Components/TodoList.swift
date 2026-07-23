//
//  TodoList.swift
//  todo
//
//  Created by Sabuj on 23/7/26.
//


import SwiftUI

struct TodoList: View {
    @Binding var tasks: [TodoItem]
    var sortedTasks: [TodoItem] {
        tasks.sorted { first, second in
            if first.isCompleted != second.isCompleted {
                return !first.isCompleted
            }
            if first.date.sortPriority != second.date.sortPriority {
                return first.date.sortPriority < second.date.sortPriority
            }
            return first.date < second.date
        }
    }
    
    var body: some View {
        VStack{
            Text("Today's Tasks")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .padding(.top, 20)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .leading)

            // task list
            ForEach(sortedTasks){ task in
                if let index = tasks.firstIndex(where: {$0.id == task.id}){
                    VStack{
                        Button(
                            action:{
                                tasks[index].isCompleted.toggle()
                            }
                        )
                        {
                            HStack(alignment: .firstTextBaseline) {
                                Image(
                                    systemName: task.isCompleted ? "checkmark.circle.fill" : "circle"
                                )
                                .foregroundStyle(task.isCompleted ? .green : .gray)
                                VStack{
                                    Group{
                                        if Calendar.current.isDateInToday(task.date) {
                                            Text("Today")
                                        } else if Calendar.current.isDateInYesterday(task.date) {
                                            Text("Yesterday")
                                        } else if Calendar.current.isDateInTomorrow(task.date) {
                                            Text("Tomorrow")
                                        } else if Calendar.current.isDateInWeekend(task.date) {
                                            Text("Weekend")
                                        } else {
                                            Text(task.date.formatted(date: .abbreviated, time: .omitted))
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.medium)
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                                    
                                    Text(task.title)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .fontWeight(.medium)
                                        .font(.title3)
                                        .strikethrough(task.isCompleted)
                                        .foregroundStyle(task.isCompleted ? .green : .black)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 13)
                    .background(Color(hex: "#efefef"))
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                }
            }
        }
    }
}
