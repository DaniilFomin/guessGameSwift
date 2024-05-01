//
//  WordCard.swift
//  guessGame
//
//  Created by Даниил Фомин on 29/04/2024.
//

import SwiftUI

struct WordCard: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var word: CDWord
    @State private var isFlipped = false
    
    var body: some View {
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 200, height: 300)
                    .cornerRadius(10)
                    .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                    .opacity(isFlipped ? 0 : 1)
                    .overlay(
                        Text(word.word).opacity(isFlipped ? 0 : 1)
                            .foregroundColor(.white)
                    )
                
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 200, height: 300)
                    .cornerRadius(10)
                    .rotation3DEffect(.degrees(isFlipped ? 0 : -180), axis: (x: 0, y: 1, z: 0))
                    .opacity(isFlipped ? 1 : 0)
                    .overlay(
                        Text(word.wordDescription)
                            .foregroundColor(.white).opacity(isFlipped ? 1 : 0)
                    )
            }
            .onTapGesture {
                withAnimation {
                    self.isFlipped.toggle()
                }
            }
        }
    }


#Preview {
    WordCard(word: CDWord.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
