//
//  BlurWindow.swift
//  InstargamDeskTop (iOS)
//
//  Created by Kanz on 2020/12/28.
//

import SwiftUI

struct BlurWindow: NSViewRepresentable {
    func makeNSView(context: Context) -> some NSView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        return view
    }
    
    func updateNSView(_ nsView: NSViewType, context: Context) {
        
    }
}
