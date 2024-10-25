//
//  ListView.swift
//  TodoList
//
//  Created by Rhushabh Madurwar on 9/25/24.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List{
            ForEach(listViewModel.items){ item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: Addview())
        )
    }
    

}
struct ListView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


