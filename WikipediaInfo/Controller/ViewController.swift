//
//  ViewController.swift
//  WikipediaInfo
//
//  Created by Manuel Carvalho on 8/2/20.
//  Copyright © 2020 Manuel Carvalho. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, DataManagerDelegate, NSTableViewDelegate, NSTableViewDataSource {
    
    var results = [Result]()

   
    @IBOutlet weak var textField: NSTextField!
    
    @IBOutlet weak var tableView: NSTableView!
    var dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.delegate = self
        dataManager.fetchBloggerData(str: "happiness")
        
        tableView.delegate = self
        tableView.dataSource = self
        
       
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func didUpdateWiki(parsedData: Wiki){
        results.removeAll()
        DispatchQueue.main.async {
            if let stringArray = parsedData.self.query.search {
                for str in stringArray {
                    self.results.append(Result(title: self.stripHTML(str: str.title!), snippet:  self.stripHTML(str: str.snippet!)))
                }
                self.tableView.reloadData()
            }

        }
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "column1") {
                print("view for tableColumn1")
            
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "Cell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {return nil }
            
            cellView.textField?.stringValue = results[row].title
               return cellView
        } else {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "Cell2")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else { return nil }
            
            cellView.textField?.stringValue = results[row].snippet
                   return cellView

        }

    }
 
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return results.count
    }
    
    func stripHTML(str: String)-> String {
        let a = str.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
        
        return a.replacingOccurrences(of: "&quot;", with: "\"", options: String.CompareOptions.regularExpression, range: nil)
    }


    @IBAction func searchButton(_ sender: NSButton) {
        print("Search Button pressed")
        let txt = textField.stringValue
        dataManager.fetchBloggerData(str: txt)
    }
}

