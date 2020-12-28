//
//  InstargamDeskTopApp.swift
//  Shared
//
//  Created by Kanz on 2020/12/27.
//

import SwiftUI

@main
struct InstargamDeskTopApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

// Hiding Focus Ring...
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
