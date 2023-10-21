//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject{
    @Published var name = "";
    @Published var email = "";
    @Published var password = "";
    @Published var confirmPassword = "";
    @Published var errorMessage = "";
    
    init(){
        
    }
    
    private func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !confirmPassword.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all the fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password length must be 6 or more"
            return false
        }
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            return false;
        }
        return true;
    }
    
    func signup(){
        guard validate() else{
            print(errorMessage)
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
}
