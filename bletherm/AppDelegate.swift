//
//  AppDelegate.swift
//  bletherm
//
//  Created by Bas Peters on 02/03/2020.
//  Copyright © 2020 Bas Peters. All rights reserved.
//

import Cocoa
import SwiftUI
import AppKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindow: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
                
        // Create the window and set the content view. 
        mainWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 350, height: 350),
            styleMask: [.closable],
            backing: .buffered, defer: false)
        mainWindow.center()
        mainWindow.setFrameAutosaveName("Main Window")
        mainWindow.contentView = NSHostingView(rootView: contentView)
        
        mainWindow.contentView?.wantsLayer = true
        mainWindow.contentView?.layer?.cornerRadius = 40
        mainWindow.contentView?.layer?.borderColor = .white
        mainWindow.contentView?.layer?.borderWidth = 6
        mainWindow.backgroundColor = NSColor.clear
        mainWindow.invalidateShadow()
                
        mainWindow.isReleasedWhenClosed = false
        mainWindow.isMovableByWindowBackground = true
        mainWindow.isOpaque = false
        mainWindow.makeKeyAndOrderFront(nil)
        
    }

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if !flag {
            sender.windows.forEach { $0.makeKeyAndOrderFront(self) }
        }
        return true
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

