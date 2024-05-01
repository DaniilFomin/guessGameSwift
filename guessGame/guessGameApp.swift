//
//  guessGameApp.swift
//  guessGame
//
//  Created by Даниил Фомин on 28/04/2024.
//

import SwiftUI
import CoreData

@main
struct guessGameApp: App {
    @StateObject var router = Router()
    //MARK: - Add persistent context
    //@Environment(\.managedObjectContext).wrappedValue(PersistenceController.shared.container.viewContext)
    //@Environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    //var context: NSManagedObjectContext
    
    var body: some Scene {
        WindowGroup {
            LaunchView().environmentObject(router)
        }
        
    }
}
#Preview{
   LaunchView().environmentObject(Router())
}
