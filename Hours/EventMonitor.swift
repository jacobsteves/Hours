//
//  EventMonitor.swift
//  Hours
//
//  Created by Jacob Steves on 2018-01-15.
//  Copyright © 2018 Jacob Steves. All rights reserved.
//

import Cocoa

class EventMonitor {
    private var monitor: Any?
    private let mask: NSEvent.EventTypeMask
    private let handler: (NSEvent?) -> Void

    // pass in a mask of events to listen for (like key down, scroll wheel moved, left click, etc) and
    // a handler for what to do in that event
    public init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent?) -> Void) {
        self.mask = mask
        self.handler = handler
    }
    
    // remove the global event monitor on deinitialization
    deinit {
        stop()
    }
    
    // when ready to start listening, start is called
    // anytime the event specified in the mask occurs, the system calls the handler
    public func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }
    
    // removes the global event monitor
    public func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}
