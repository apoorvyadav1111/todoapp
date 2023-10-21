//
//  LoginView.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView{
            VStack{
                // Header
                HeaderView(title:"To Do List", subtitle: "Get things done", angle: 15, background: Color.teal)
                
                // Login Form
                
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email", text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Password", text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title:"Log in",background:Color.teal){
                        viewModel.login()
                    }.padding()
                }
                // Create Account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }.padding(.bottom, 30)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
