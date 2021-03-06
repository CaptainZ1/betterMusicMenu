//
//  betterMusicMenuApp.swift
//  betterMusicMenu
//
//  Created by Iain Zwiebel on 2/20/22.
//  Based on https://github.com/zaferarican/menubarpopoverswiftui2
//

import SwiftUI

@main
struct betterMusicMenuApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        AppDelegate.shared = self.appDelegate
    }
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover.init()
    var statusBarItem: NSStatusItem?
    static var shared : AppDelegate!
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        let contentView = ContentView()

        // Set the SwiftUI's ContentView to the Popover's ContentViewController
        popover.behavior = .transient
        popover.animates = false
        popover.contentViewController = NSViewController()
        popover.contentViewController?.view = NSHostingView(rootView: contentView)
        popover.contentViewController?.view.window?.makeKey()
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusBarItem?.button?.image = NSImage(systemSymbolName: "music.note.house.fill", accessibilityDescription: "placeholder")
        //statusBarItem?.button?.title = "Test"
        statusBarItem?.button?.action = #selector(AppDelegate.togglePopover(_:))
    }
    @objc func showPopover(_ sender: AnyObject?) {
        if let button = statusBarItem?.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
//            !!! - displays the popover window with an offset in x in macOS BigSur.
        }
    }
    @objc func closePopover(_ sender: AnyObject?) {
        popover.performClose(sender)
    }
    @objc func togglePopover(_ sender: AnyObject?) {
        if popover.isShown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
}
