//
//  HoursViewController.swift
//  Hours
//
//  Created by Jacob Steves on 2018-01-15.
//  Copyright © 2018 Jacob Steves. All rights reserved.
//

import Cocoa

class HoursViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

// This method is created so that anything that uses HoursViewController doesn't need
// to know how to instantiate it
extension HoursViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> HoursViewController {
        //1. Get a reference to Main.storyboard
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        //2. Create a Scene Indentifier that matches the one we set before
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "HoursViewController")
        //3. Instantiate HoursViewController and return it
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? HoursViewController else {
            fatalError("Why cant i find HoursViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}
