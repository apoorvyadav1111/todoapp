//
//  EditItemView.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/21/23.
//

import SwiftUI

struct EditItemView: View {
    @StateObject var viewModel:EditItemViewModel
    @Binding var editItemPresented:Bool

    
    init(editItem: ToDoListItem, editItemPresented: Binding<Bool>){
        self._viewModel  = StateObject(wrappedValue: EditItemViewModel(editItem: editItem))
        self._editItemPresented = editItemPresented
    }
    
    var body: some View {
        VStack{
        
            Text("Edit Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,60)
            
            Form{
                TextField("Title", text:$viewModel.editItem.title)
                TextField("Details", text:$viewModel.editItem.details)
                 TLButton(title: "Save", background: .pink){
                     if viewModel.canSave {
                         viewModel.save()
                         editItemPresented = false
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

#Preview {
    EditItemView(editItem: ToDoListItem(id: "", title: "", details: "", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
                    ,
                 editItemPresented: Binding(get:{
        return true
    },set:{
        _ in
    })
    )
}
