import Foundation
import SwiftUI
import SwiftData

@Model
class Player: Identifiable, Hashable {
    internal var id: UUID
    private var name: String
    private var color: String
    
    init(name: String, color: String) {
        self.id = UUID()
        self.name = name
        self.color = color
    }
    
    // Getters and Setters
    func getId() -> UUID {
        return id
    }
    
    func getName() -> String {
        return name
    }
    
    func setName(_ name: String) {
        self.name = name
    }
    
    func getColor() -> Color {
        return Color("yellow")
    }
    
    func setColor(_ color: String) {
        self.color = color
    }
}
