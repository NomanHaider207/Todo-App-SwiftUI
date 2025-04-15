//
//  Todo_AppApp.swift
//  Todo App
//
//  Created by Dev  on 4/14/25.
//

import SwiftUI

@main
struct Todo_AppApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
       
    }
}
