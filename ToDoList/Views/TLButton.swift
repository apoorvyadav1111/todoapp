//
//  TLButton.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/4/23.
//

import SwiftUI

struct TLButton: View {
    let title: String;
    let background: Color;
    let action: ()->Void;
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                
            }
        }
    }
}

#Preview {
    TLButton(title: "Button", background: Color.red){
        //Action
    }
}
