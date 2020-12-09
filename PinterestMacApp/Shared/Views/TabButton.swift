//
//  TabButton.swift
//  PinterestMacApp (iOS)
//
//  Created by Kanz on 2020/12/09.
//

import SwiftUI

var black = Color.black.opacity(0.5)

struct TabButton: View {
    var image: String
    var title: String
    @Binding var selected: String
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selected = title
            }
        }, label: {
            HStack {
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(selected == title ? Color.black : black)
                    .frame(width: 25)
                
                Text(title)
                    .fontWeight(selected == title ? .semibold : .none)
                    .foregroundColor(selected == title ? Color.black : black)
                    .animation(.none)
                
                Spacer()
                
                // Capsule
                ZStack {
                    Capsule()
                        .fill(Color.clear)
                        .frame(width: 3, height: 25)
                    
                    if selected == title {
                        Capsule()
                            .fill(Color.black)
                            .frame(width: 3, height: 25)
                            .matchedGeometryEffect(id: /*@START_MENU_TOKEN@*/"ID"/*@END_MENU_TOKEN@*/, in: animation)
                    }
                }
            }
            .padding(.leading)
        })
        .buttonStyle(PlainButtonStyle())
    }
}

//struct TabButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TabButton(image: "circle.fill", title: "Title", selected: .constant("circle"), animation: <#Namespace.ID#>)
//    }
//}
