//
//  HeaderView.swift
//  ToDoList
//
//  Created by Apoorv Yadav on 10/3/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size:50))
                    .bold()
                
                
                Text(subtitle)
                    .font(.system(size:30))
                    .foregroundColor(.white)
            }.padding(.top, 30)
        }.frame(width: UIScreen.main.bounds.width*3, height: 300)
            .offset(y:-100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title:"To Do List", subtitle: "Get things done", angle: 15, background: Color.pink)
    }
}
