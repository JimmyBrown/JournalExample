//
//  Entry.swift
//  Journal
//
//  Created by Jimmy Brown on 4/15/20.
//  Copyright © 2020 Jimmy Brown. All rights reserved.
//

import Foundation

class Entry: Codable {
    
    var timestamp: Date
    var title: String
    var body: String
    
    init(timestamp: Date = Date(), title: String, body: String) {
        self.timestamp = timestamp
        self.title = title
        self.body = body
    }
}

extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && lhs.body == rhs.body
    }
}
