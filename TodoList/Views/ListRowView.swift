//
//  ListRowView.swift
//  TodoList
//
//  Created by Rhushabh Madurwar on 9/25/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "first", isCompleted: false)
    static var item2 = ItemModel(title: "second", isCompleted:true)
    
    static var previews: some View{
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
