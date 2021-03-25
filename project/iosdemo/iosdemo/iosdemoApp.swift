//
//  iosdemoApp.swift
//  iosdemo
//
//  Created by Findaaron on 2021/3/25.
//

import SwiftUI

@main
struct iosdemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
