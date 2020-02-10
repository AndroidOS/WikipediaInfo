//
//  ViewController.swift
//  WikipediaInfo
//
//  Created by Manuel Carvalho on 8/2/20.
//  Copyright © 2020 Manuel Carvalho. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, DataManagerDelegate {
   
     var dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.delegate = self
        dataManager.fetchBloggerData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func didUpdateWiki(parsedData: Wiki){
        DispatchQueue.main.async {
            print("didUpdateWiki fired \(parsedData.self.query.search)")
        }
    }


}

