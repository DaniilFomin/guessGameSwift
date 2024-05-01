import SwiftUI
import Foundation

// ViewModel
class PlayerViewModel: ObservableObject {
    @Published var players: [Player]
    @Published var newPlayerName: String = ""
    @Published var isDrawerOpen: Bool = false
    
    init() {
        self.players = [Player(name: "John", color: "red")]
    }
    
    func deletePlayer(at index: Int) {
        players.remove(at: index)
    }
    
    func addPlayer() {
        players.append(Player(name: newPlayerName, color: "black"))
        newPlayerName = ""
    }
}
//, Player(name: "Ivan", color: "red"), Player(name: "Peter", color: "red"), Player(name: "Sam", color: "red"), Player(name: "Red", color: "red")
