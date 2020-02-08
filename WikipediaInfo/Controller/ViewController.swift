//
//  ViewController.swift
//  WikipediaInfo
//
//  Created by Manuel Carvalho on 8/2/20.
//  Copyright © 2020 Manuel Carvalho. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
     var dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager.fetchBloggerData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

