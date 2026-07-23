//
//  Todo.swift
//  todo
//
//  Created by Sabuj on 21/7/26.
//

import SwiftUI

let columns = [
    GridItem(.flexible(), spacing: 10),
    GridItem(.flexible(), spacing: 10)
]

struct TodoCardView: View {
    @Binding var tasks: [TodoItem]

    var todayTask: [TodoItem] {
        tasks.filter { Calendar.current.isDateInToday($0.date) }
    }

    var scheduledTask: [TodoItem] {
        tasks.filter { $0.date > Date() && !$0.isCompleted }
    }

    var pandingTask: [TodoItem] {
        tasks.filter { !$0.isCompleted }
    }

    var cards: [TodoCardItem] {
        [
            TodoCardItem(icon: "square.stack.3d.up", title: "All", total: tasks.count, color: "#00A89D", bg: "#E0FFFB"),
            TodoCardItem(icon: "circle.grid.2x2", title: "Today", total: todayTask.count, color: "#B4C4FE", bg: "#EEF2FF"),
            TodoCardItem(icon: "clock", title: "Pending", total: pandingTask.count, color: "#930418", bg: "#FFE5EA"),
            TodoCardItem(icon: "timer", title: "Scheduled", total: scheduledTask.count, color: "#8B68AC", bg: "#eadcf7")
        ]
    }

    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(cards) { card in
                VStack(alignment: .leading) {
                    VStack(alignment: .center) {
                        Image(systemName: card.icon)
                            .foregroundStyle(Color(hex: card.color ?? "#B4C4FE"))
                            .font(.system(size: 25))
                            .padding(10)
                    }
                    .frame(width: 50, height: 50)
                    .background(.white)
                    .clipShape(Circle())

                    HStack(alignment: .lastTextBaseline) {
                        Text(card.title)
                            .font(.system(size: 18))
                        Spacer()
                        Text(String(format: "%02d", card.total))
                            .font(.system(size: 28))
                            .fontWeight(.medium)
                    }
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(Color(hex: card.bg ?? "#F2F2F7"))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
    }
}
