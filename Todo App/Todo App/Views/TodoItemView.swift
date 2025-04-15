//
//  TodoItemView.swift
//  Todo App
//
//  Created by Dev  on 4/14/25.
//

import SwiftUI

struct TodoItemView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
        
    }
}

#Preview {
    TodoItemView(item: ItemModel(title: "Item 2", isCompleted: false))
}
