//
//  MainWindowController.swift
//  GeoConverter
//
//  Created by Holger Hinzberg on 09.07.19.
//  Copyright © 2019 Holger Hinzberg. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        var infoDictionary = Bundle.main.infoDictionary! as Dictionary
        let currentVersion:String = infoDictionary["CFBundleShortVersionString"] as! String
        self.window?.title = "GeoConverter Version " + currentVersion
    }

}
