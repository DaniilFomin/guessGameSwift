//
//  WordModelView.swift
//  guessGame
//
//  Created by Даниил Фомин on 29/04/2024.
//

import Foundation
import CoreData


// ViewModel
class WordsViewModel: ObservableObject {
    @Published var words: [CDWord]
    @Published var currentWord: CDWord
    @Published var wordPosition: Int = 1
    init(){
        
        let context = PersistenceController.preview.container.viewContext
        
        let fetchRequest: NSFetchRequest<CDWord> = CDWord.fetch()
        
        var words: [CDWord] = []
        do{
            words = try context.fetch(fetchRequest)
        } catch let error {
            print(error)
        }
            self.words = words
            self.wordPosition = 0
            
            self.currentWord = words[0]
    }
    
    func getWord() -> CDWord {
        return self.currentWord
    }
    
    func getNextWord() -> CDWord {
        self.wordPosition += 1
        self.currentWord = self.words[self.wordPosition]
        if currentWord === self.words.last {self.resetCounter()}
        return self.currentWord
    }
    
    func resetCounter() {
        self.wordPosition = 0
    }
    
    func updateWords() {
    }
}


