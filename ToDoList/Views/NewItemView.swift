//
//  NewItemView.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented:Bool
    
    var body: some View {
        VStack{
        
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,60)
            
            Form{
                TextField("Title", text:$viewModel.title)
                TextField("Details", text:$viewModel.details)
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                 TLButton(title: "Save", background: .pink){
                     if viewModel.canSave {
                         viewModel.save()
                         newItemPresented = false
                     }else{
                         viewModel.showAlert = true
                     }

                 }
                 .padding()
            }.alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text(viewModel.alertMsg)
                )
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get:{
            return true
        },set:{
            _ in
        }))
    }
}
