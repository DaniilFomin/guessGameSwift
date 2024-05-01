//
//  api.swift
//  guessGame
//
//  Created by Даниил Фомин on 29/04/2024.
//

import Foundation
import SwiftUI

class APIHandler {
    var words: [WordApi] = []
    func loadData(completion: @escaping(_ words: [WordApi]) -> Void) {
        
        guard let url = URL(string: "https://mocki.io/v1/527b0017-a3df-424e-9e50-343294f0ac6b") else {
            print("InvalidUrl")
            return
        }
        
        var req = URLRequest(url: url)
        
        
        req.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let _: Void = session.dataTask(with: req) { data, response, error in
            if let data = data {
                do{
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedResponse = try decoder.decode([WordApi].self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedResponse)
                    }
                }catch {
                    print("Error decoding response")
                }
                
            }
        }.resume()
    }
    
    func getWords() -> [WordApi] {
        return self.words
    }
}

public struct APIResponse<T: Codable>: Codable {
    public let word: String
    public let wordDescription: String
}

struct WordApi: Decodable, Identifiable {
    let id: UUID = UUID()
    let word: String
    let wordDescription: String
}
