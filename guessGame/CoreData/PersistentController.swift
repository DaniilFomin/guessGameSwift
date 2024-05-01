//
//  PersistentController.swift
//  guessGame
//
//  Created by Даниил Фомин on 29/04/2024.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        self.container = NSPersistentContainer(name: "GuessGame")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores {
            description, error in
            if let error = error as NSError? {
                fatalError("Error loading container: \(error) \(error.userInfo)")
            }
        }
    }
    
    //MARK: - SwiftUi preview helper
    
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let context = controller.container.viewContext
        
        for var i in 1 ... 100 {
            let word = CDWord(word: "ExampleWord-\(i)", wordDescription: "ExampleDescription-\(i)", context: context)
        }
        
        
        return controller
    }()
    
    
}
