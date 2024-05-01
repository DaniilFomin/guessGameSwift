//
//  Router.swift
//  guessGame
//
//  Created by Даниил Фомин on 01/05/2024.
//

import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    @Published var routes: [String] = ["Main", "Game", "Stats"]
    
    func reset() {
        self.path = NavigationPath()
    }
}
