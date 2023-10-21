//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class NewItemViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var details = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    @Published var alertMsg = ""
    
    init(){
        
    }
    
    public func save(){
        guard canSave else {
            return
        }
        // get Current user id
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        // Create a Model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   details: details,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        
        // Save the model to db
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            alertMsg = "title cannot be empty"
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            alertMsg = "Due date cannot be in the past"
            return false
        }
        alertMsg = ""
        showAlert = false
        return true
    }
}
