import SwiftUI

struct MainView: View {
    @State private var isDrawerOpen = false
    
    var body: some View {
        VStack {
            Button("Button 1") {
                print("Button 1 tapped")
            }
            .frame(height: 50)
            
            Button("Button 2") {
                print("Button 2 tapped")
            }
            .frame(height: 50)
            
            Button("Button 3") {
                print("Button 3 tapped")
            }
            .frame(height: 50)
            
            Button("Open Drawer") {
                withAnimation {
                    isDrawerOpen.toggle()
                }
            }
            .frame(width: 150, height: 40)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .overlay(
            DrawerView(isOpen: $isDrawerOpen)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .offset(y: isDrawerOpen ? UIScreen.main.bounds.height - 200 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 0.3))
        )
    }
}

struct DrawerView: View {
    @Binding var isOpen: Bool
    @State private var newPlayerName = ""
    @State private var players = [Player(name: "John", color: .red)]
    
    var body: some View {
        List {
            ForEach(players) { player in
                PlayerRow(player: player, onDelete: {
                    if let index = players.firstIndex(where: { $0.id == player.id }) {
                        players.remove(at: index)
                    }
                })
            }
            Button(action: addPlayer) {
                Text("Add Player")
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
    
    private func addPlayer() {
        players.append(Player(name: newPlayerName, color: .black))
        newPlayerName = ""
    }
}

struct PlayerRow: View {
    let player: Player
    var onDelete: () -> Void
    
    var body: some View {
        HStack {
            Text(player.name)
                .foregroundColor(player.color)
            
            Spacer()
            
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
    }
}

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var color: Color
}
