//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{
    let id: String
    var title: String
    var details: String
    var dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
