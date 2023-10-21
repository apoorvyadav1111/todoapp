//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
