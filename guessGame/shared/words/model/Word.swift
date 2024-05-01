//
//  Word.swift
//  guessGame
//
//  Created by Даниил Фомин on 29/04/2024.
//

import Foundation

class Word {
    private var wordDescription: String
    private var word: String
    
    init(wordDescription: String, word: String) {
        self.wordDescription = wordDescription
        self.word = word
    }
    
    func getWord() -> String {
        return self.word
    }
    
    func setWord(word: String) {
        self.word = word
    }
    
    func getDescription() -> String {
        return self.wordDescription
    }
    
    func setDescription(wordDescription: String) {
        self.wordDescription = wordDescription
    }
}

