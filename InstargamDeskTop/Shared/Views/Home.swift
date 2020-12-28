//
//  Home.swift
//  InstargamDeskTop (iOS)
//
//  Created by Kanz on 2020/12/27.
//

import SwiftUI

// Gradient..
let gradient = LinearGradient(gradient: .init(colors: [Color("gradient1"), Color("gradient2")]),
                              startPoint: .leading,
                              endPoint: .trailing)

struct Home: View {
    var screen = NSScreen.main!.visibleFrame
    
    var body: some View {
        HStack(spacing: 0.0) {
            
            // SideView
            SideView()
            
            // MainView
            MainView()
        }
//        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen.width / 1.4,
               height: screen.height - 60)
        .background(BlurWindow())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
