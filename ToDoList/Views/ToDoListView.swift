//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel;
    @FirestoreQuery var items: [ToDoListItem]

    
    init(userId:String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items){
                    item in ToDoListItemView(item:item)
                        .swipeActions{

                            Button{
                                viewModel.delete(id: item.id)
                            }label:{
                                Image(systemName: "trash")
                            }.tint(.red)
                            
                            Button{
                                viewModel.editItem = item
                                viewModel.showingEditItemView = true
                            }label: {
                                Image(systemName: "pencil")
                            }.tint(.yellow)
                        }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            .sheet(isPresented: $viewModel.showingEditItemView){
                EditItemView(editItem: viewModel.editItem, editItemPresented: $viewModel.showingEditItemView )
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "yV4n2p1fN9dzh5E2vSMpDkpRs4A2")
    }
}
