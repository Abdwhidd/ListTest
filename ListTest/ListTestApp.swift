//
//  ListTestApp.swift
//  ListTest
//
//  Created by Wahid on 29/06/22.
//

import SwiftUI

@main
struct ListTestApp: App {
    
    @StateObject var todoManager = TodoListMagager()
    
    var body: some Scene {
        WindowGroup {
            TodoListView()
        }
    }
}
