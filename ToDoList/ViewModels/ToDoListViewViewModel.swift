//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//

import Foundation
import FirebaseFirestore

// ViewModel for list of items
class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false;
    @Published var showingEditItemView = false;
    @Published var editItem:ToDoListItem = ToDoListItem(id:"", title: "", details: "", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false);
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId;
    }
    
    func edit(id: String){
    }
    func delete(id: String ){
        let db = Firestore.firestore()
        db.collection("users")
            .document(self.userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
