//
//  DataManager.swift
//  WikipediaInfo
//
//  Created by Manuel Carvalho on 8/2/20.
//  Copyright © 2020 Manuel Carvalho. All rights reserved.
//

import Foundation

protocol  DataManagerDelegate {
    func didUpdateWiki()
}

struct DataManager {
    
    let bloggerURL = "https://en.wikipedia.org/w/api.php?action=query&format=json&list=search&srsearch=meaning"
    var delegate: DataManagerDelegate?
    
    func fetchBloggerData(){
       
        performRequest(urlString: bloggerURL)
    }
    
    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let str = String(decoding: safeData, as: UTF8.self)
                    self.parseJSON(bloggerData: safeData)
                    print(str)
                }
            }
            
            
            task.resume()
        }
        
    }
    
    func parseJSON(bloggerData: Data){
        print(bloggerData)
        self.delegate?.didUpdateWiki()
    }
        
    
}

