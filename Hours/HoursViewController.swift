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
    }
    
    @objc func runCode() {
        let screens = NSScreen.screens
        let newWallpaperURL = NSURL(fileURLWithPath: textLabel.stringValue)
        print(textLabel.stringValue);
        
        for i in screens {
            try! NSWorkspace.shared.setDesktopImageURL(newWallpaperURL as URL, for: i, options: [:])
        }
    }
    
    func update() {
        let screens = NSScreen.screens
        let newWallpaperURL = NSURL(fileURLWithPath: textLabel.stringValue)
        print(textLabel.stringValue);
        
        for i in screens {
            try! NSWorkspace.shared.setDesktopImageURL(newWallpaperURL as URL, for: i, options: [:])
        }
        print("updating")
    }
    
    func updateFile(path: String) {
        textLabel.stringValue = path;
    }
    
    @IBOutlet var textLabel: NSTextField!
    @IBOutlet var datePicker: NSDatePicker!
    
}

extension HoursViewController {
    func browseFile(sender: AnyObject) {
        
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose a .txt file";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["png", "jpg", "jpeg"];
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file
            
            if (result != nil) {
                let path = result!.path
                updateFile(path: path);
            }
        } else {
            // User clicked on "Cancel"
            return
        }
        
    }
    
    @IBAction func selectFile(sender: NSButton) {
        browseFile(sender: sender)
    }
    
    @IBAction func saveWallpaper(sender: NSButton) {
        let date = datePicker.dateValue
        let timer = Timer(fireAt: date, interval: 86400, target: self, selector: #selector(runCode), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
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
