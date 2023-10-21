//
//  EditItemViewModel.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/21/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class EditItemViewModel: ObservableObject{
    @Published var editItem: ToDoListItem
    @Published var showAlert = false
    @Published var alertMsg = ""
    
    init(editItem: ToDoListItem){
        self.editItem = editItem
        
    }
    
    public func save(){
        guard canSave else {
            return
        }
        
        // get Current user id
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        let id = editItem.id
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(id)
            .setData(self.editItem.asDictionary())
    }
    
    var canSave: Bool{
        guard !editItem.title.trimmingCharacters(in: .whitespaces).isEmpty else {
            alertMsg = "title cannot be empty"
            return false
        }
        
        alertMsg = ""
        showAlert = false
        return true
    }
    
}
