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
struct StatCardView: View {
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            VStack(alignment: .leading) {
                Image(systemName: "clock.fill")
                    .foregroundStyle(Color(hex: "#B4C4FE"))
                    .font(.system(size: 25))
                    .padding(10)
                    .background(Color.white)
                    .clipShape(Circle())
                
                HStack(alignment: .lastTextBaseline){
                    Text("Today")
                        .font(.system(size: 18))
                    Spacer()
                    Text("6")
                        .font(.system(size: 28))
                        .fontWeight(.medium)
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(hex: "#B4C4FE"))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack(alignment: .leading) {
                Image(systemName: "clock.fill")
                    .foregroundStyle(Color(hex: "##FFF580"))
                    .font(.system(size: 25))
                    .padding(10)
                    .background(Color.white)
                    .clipShape(Circle())
                
                HStack(alignment: .lastTextBaseline){
                    Text("Scheduled")
                        .font(.system(size: 18))
                    Spacer()
                    Text("5")
                        .font(.system(size: 28))
                        .fontWeight(.medium)
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(hex: "##FFF580"))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack(alignment: .leading) {
                Image(systemName: "clock.fill")
                    .foregroundStyle(Color(hex: "##D0F4EA"))
                    .font(.system(size: 25))
                    .padding(10)
                    .background(Color.white)
                    .clipShape(Circle())
                
                HStack(alignment: .lastTextBaseline){
                    Text("All")
                        .font(.system(size: 18))
                    Spacer()
                    Text("14")
                        .font(.system(size: 28))
                        .fontWeight(.medium)
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(hex: "##D0F4EA"))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack(alignment: .leading) {
                Image(systemName: "clock.fill")
                    .foregroundStyle(Color(hex: "##FFC0F5"))
                    .font(.system(size: 25))
                    .padding(10)
                    .background(Color.white)
                    .clipShape(Circle())
                
                HStack(alignment: .lastTextBaseline){
                    Text("Overdue")
                        .font(.system(size: 18))
                    Spacer()
                    Text("3")
                        .font(.system(size: 28))
                        .fontWeight(.medium)
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(hex: "##FFC0F5"))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}
