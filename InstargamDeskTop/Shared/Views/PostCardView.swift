//
//  PostCardView.swift
//  InstargamDeskTop
//
//  Created by Kanz on 2020/12/28.
//

import SwiftUI

struct PostCardView: View {
    var image: String
    var body: some View {
        
        GeometryReader { reader in
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: reader.frame(in: .global).width,
                           height: 250)
                    .cornerRadius(10)
                
                HStack {
                    // User Your Own Post Model Data Here..
                    Image("pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .padding(5)
                        .background(Circle().stroke(gradient, lineWidth: 2))
                        .clipShape(Circle())
                    
                    Text("Kanz")
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}, label: {
                        Label(
                            title: { Text("1.2K") },
                            icon: { Image(systemName: "suit.heart") }
                        )
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {}, label: {
                        Label(
                            title: { Text("556") },
                            icon: { Image(systemName: "message") }
                        )
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal)
            }
        }
        .frame(height: 300)
    }
}

struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
