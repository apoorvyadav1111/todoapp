//
//  User.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
