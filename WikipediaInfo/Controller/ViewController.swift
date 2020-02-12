//
//  ViewController.swift
//  WikipediaInfo
//
//  Created by Manuel Carvalho on 8/2/20.
//  Copyright © 2020 Manuel Carvalho. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, DataManagerDelegate, NSTableViewDelegate, NSTableViewDataSource {
    
    var results = [String]()
   
    @IBOutlet weak var tableView: NSTableView!
    var dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.delegate = self
        dataManager.fetchBloggerData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        results.append("Blue")
        results.append("Yellow")
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
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "column1") {
                print("view for tableColumn1")
            
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "Cell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {return nil }
            
            cellView.textField?.stringValue = results[row]
               return cellView
        } else {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "tableCell2")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else { return nil }
                cellView.textField?.stringValue = "TEST2"
                   return cellView

        }

    }
 
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return results.count
    }


}

