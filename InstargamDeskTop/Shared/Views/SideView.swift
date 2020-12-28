//
//  SideView.swift
//  InstargamDeskTop
//
//  Created by Kanz on 2020/12/28.
//

import SwiftUI

struct SideView: View {
    var screen = NSScreen.main!.visibleFrame
    @State var selectedTab: String = "Explore"
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 15.0) {
            HStack(spacing: 10.0) {
                Image("instagram")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text("Instagram")
                    .font(.custom("Billabong", size: 30.0))
                
                Spacer()
            }
            .padding()
            .padding(.top, 20.0)
            
            Image("pic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 65, height: 65)
                .clipShape(Circle())
                .padding(5)
                .background(
                    Circle()
                        .stroke(gradient, lineWidth: 2)
                )
                .clipShape(Circle())
                
            Text("Kanz")
                .font(.title)
                .foregroundColor(.white)
            
            Text("@moong's father")
                .foregroundColor(.gray)
            
            // Followers..
            HStack {
                
                VStack(spacing: 8) {
                    Text("1.2K")
                        .foregroundColor(.white)
                    
                    Text("Posts")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                Divider()
                
                VStack(spacing: 8) {
                    Text("1.8M")
                        .foregroundColor(.white)
                    
                    Text("Followers")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                Divider()
                
                VStack(spacing: 8) {
                    Text("22")
                        .foregroundColor(.white)
                    
                    Text("Following")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: 50)
            
            // Tab Buttons..
            Group {
                // Explore
                TabButton(image: "rectangle.3.offgrid",
                          title: "Explore",
                          selected: $selectedTab,
                          animation: animation)
                    .padding(.top)
                
                // Feed
                TabButton(image: "magnifyingglass",
                          title: "Feed",
                          selected: $selectedTab,
                          animation: animation)
                
                // Notifications
                TabButton(image: "bell",
                          title: "Notifications",
                          selected: $selectedTab,
                          animation: animation)
                
                TabButton(image: "paperplane",
                          title: "Direct",
                          selected: $selectedTab,
                          animation: animation)
                
                // IGTV
                TabButton(image: "play.tv",
                          title: "IGTV",
                          selected: $selectedTab,
                          animation: animation)
                
                // Settings
                TabButton(image: "gear",
                          title: "Settings",
                          selected: $selectedTab,
                          animation: animation)
            }
            
            Spacer()
            
            Divider()
                .padding(.horizontal, 20)
            
            Spacer()
            
            TabButton(image: "arrow.down.forward.square",
                      title: "Logout",
                      selected: .constant(""),
                      animation: animation)
                .padding(.bottom, 20)
        }
        .frame(maxWidth: (screen.width / 1.4) / 3.5,
               maxHeight: .infinity)
        .background(BlurWindow())
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
