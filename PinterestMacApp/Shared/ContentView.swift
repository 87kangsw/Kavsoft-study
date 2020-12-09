//
//  ContentView.swift
//  Shared
//
//  Created by Kanz on 2020/12/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.light) // // always light Theme
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
