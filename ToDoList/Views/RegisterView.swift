//
//  RegisterView.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title:"Register", subtitle: "Start organizing tasks", angle: 15, background: Color.orange)
           
            
            Form{
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                TextField("Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                
                TextField("Email", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                
                TLButton(title: "Create Account", background: Color.green){
                    viewModel.signup()
                }.padding()
            }
            
            Spacer()
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
