//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

// Item of the list
class ToDoListItemViewViewModel: ObservableObject{
    init(){
        
    }
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(item.id)
            .setData(itemCopy.asDictionary())
    }
}

