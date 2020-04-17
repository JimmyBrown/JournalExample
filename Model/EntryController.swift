//
//  EntryController.swift
//  Journal
//
//  Created by Jimmy Brown on 4/15/20.
//  Copyright © 2020 Jimmy Brown. All rights reserved.
//

import Foundation

    class EntryController {
    
    static let sharedInstance = EntryController()
    
    var entries: [Entry] = []
    
    func addEntryWith(newTitleName: String, newBody: String) {
        let entry = Entry(title: newTitleName, body: newBody)
        entries.append(entry)
        saveToPersistentStorage()
    }
    
    func update(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.body = title
        saveToPersistentStorage()
    }
    
    func remove(entryToDelete: Entry) {
        guard let indexToDelete = entries.firstIndex(of: entryToDelete) else { return }
        entries.remove(at: indexToDelete)
        saveToPersistentStorage()
    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "journal.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func createFileForPersistentStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Entry.json") // <- Make sure to change this
        return fileURL
    }
    
    func saveToPersistentStorage() {
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonEntries = try jsonEncoder.encode(entries)
            try jsonEntries.write(to: createFileForPersistentStore())
        } catch let encodingError {
            print("There was an error encoding the data \(encodingError.localizedDescription)")
        }
    }
    
    func loadFromPersistentStorage() {
        let jsonDecoder = JSONDecoder()
        
        do {
            let decodedData = try Data(contentsOf: createFileForPersistentStore())
            entries = try jsonDecoder.decode([Entry].self, from: decodedData)
        } catch {
            print("There was an error decoding the data")
        }
    }
}

