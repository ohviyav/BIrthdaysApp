//
//  BIrthdaysAppApp.swift
//  BIrthdaysApp
//
//  Created by Scholar on 7/11/25.
//

import SwiftUI
import SwiftData

@main
struct BIrthdaysAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                //this line of code is setting up data storage so the app can 
                .modelContainer(for: Friend.self)
            
        }
    }
}
