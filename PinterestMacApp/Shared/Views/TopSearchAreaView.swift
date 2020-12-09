//
//  TopSearchAreaView.swift
//  PinterestMacApp (iOS)
//
//  Created by Kanz on 2020/12/10.
//

import SwiftUI

struct TopSearchAreaView: View {
    @State var search = ""
    
    var body: some View {
        HStack(spacing: 12) {
            
            // SearchBar
            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search", text: $search)
                    .textFieldStyle(PlainTextFieldStyle())
                
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(BlurWindow())
            .cornerRadius(10)
            
            Button(action: {}, label: {
                
                Image(systemName: "slider.vertical.3")
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
            }).buttonStyle(PlainButtonStyle())
            
            
            Button(action: {}, label: {
                
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.black)
                    .cornerRadius(10)
            }).buttonStyle(PlainButtonStyle())
        }
    }
}

// Hiding Focus Ring..
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
