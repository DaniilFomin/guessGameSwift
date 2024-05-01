//
//  CDWord+helper.swift
//  guessGame
//
//  Created by Даниил Фомин on 29/04/2024.
//

import Foundation
import CoreData

extension CDWord {
    
     var uuid: UUID {
        uuid_ ?? UUID()
    }
    
    var word: String {
        get {word_ ?? " "}
        set {word_ = newValue}
    }
    
    var wordDescription: String {
        get {wordDescription_ ?? " "}
        set {wordDescription_ = newValue}
    }
    
    //MARK: - Possibly will need BatchDelete
    static func delete(word: CDWord) {
        guard let context = word.managedObjectContext else { return }
        
        context.delete(word)
    }
    
    static func fetch(_ predicate: NSPredicate = .all) -> NSFetchRequest<CDWord> {
        let request = CDWord.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \CDWord.uuid_, ascending: true)]
        
        request.predicate = predicate
        
        return request
    }

    
    convenience init(word: String, wordDescription: String, context: NSManagedObjectContext) {
        self.init(context: context)
        self.word = word
        self.wordDescription = wordDescription
    }
    
    public override func awakeFromInsert() {
        self.uuid_ = UUID()
    }
    
    //MARK: - Preview helpers
    
    static var example: CDWord{
        let context = PersistenceController.preview.container.viewContext
        
        let exampleWord = CDWord(word: "АБАЖУР", wordDescription: "Колпак для лампы, светильника.", context: context)
        
           return exampleWord
        }
    }
