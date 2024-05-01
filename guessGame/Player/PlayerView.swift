//import SwiftUI
//// View
//MARK: TODO Create playerCustomizationView
//struct PlayerView: View {
//    @ObservedObject var viewModel = PlayerViewModel()
//    @ObservedObject var settings = SettingsViewModel()
//    @State var path = NavigationPath()
//    
//    var body: some View {
//        NavigationStack(path: $path){
//            VStack {
//                
//                ForEach(viewModel.players) { player in
//                    NavigationLink(value: player){
//                        PlayerRow(player: player, onDelete: {
//                            if let index = viewModel.players.firstIndex(where: { $0.id == player.id }) {
//                                viewModel.deletePlayer(at: index)
//                            }
//                        })
//                    }
//                    .navigationDestination(for: Player.self) {player in
//                        Text(player.getName())
//                    }
//                }
//                
//                Spacer()
//                
//                
//            
//            }
//        }
//        
//}
//
//
//#Preview{
//  PlayerView()
//}
