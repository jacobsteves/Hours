//
//  AppDelegate.swift
//  Hours
//
//  Created by Jacob Steves on 2018-01-15.
//  Copyright © 2018 Jacob Steves. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    let popover = NSPopover()
    
    // open or close the popover depending on its current state
    // the @objc exposes the method to Objective-C runtime to allow the button to use as an action
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    // Display the popover to the user. Supplying a source rect will give macOS everything it
    // needs to position the popover to make it look like its coming from the menu bar icon
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    // simply closes the popover
    func closePopover(sender: Any?) {
        popover.performClose(sender)
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
            button.action = #selector(togglePopover(_:))
        }
        popover.contentViewController = HoursViewController.freshController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}
