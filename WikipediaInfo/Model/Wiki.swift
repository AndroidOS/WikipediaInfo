//
//  Wiki.swift
//  WikipediaInfo
//
//  Created by Manuel Carvalho on 10/2/20.
//  Copyright © 2020 Manuel Carvalho. All rights reserved.
//

import Foundation

struct Continue: Decodable
{
    let sroffset: Int?
    let `continue`: String?
}

struct Searchinfo: Decodable
{
    let totalhits: Int?
}

struct Search: Decodable
{
    let ns: Int?
    let title: String?
    let pageid: Int?
    let size: Int?
    let wordcount: Int?
    let snippet: String?
    let timestamp: String?
}

struct Query: Decodable
{
    let searchinfo: Searchinfo?
    let search: [Search]?
}

struct Wiki: Decodable
{
    let batchcomplete: String?
    let `continue`: Continue?
    let query: Query
}
