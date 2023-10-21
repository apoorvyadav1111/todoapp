//
//  ProfileView.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user: user)
                }else{
                    Text("Loading Data...")
                }
                
            }
            .navigationTitle("Profile")
        }.onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user:User)->some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.gray)
            .frame(width:125,height:135)
            .padding(.bottom, 10)
        
        // Information
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                Text(user.name)
            }.padding()
            HStack{
                Text("Email: ")
                Text(user.email)
            }.padding()
            HStack{
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time:.shortened))")
            }.padding()
        }
        Spacer()
        Button("Log out"){
            viewModel.logout()
        }.tint(.red)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
