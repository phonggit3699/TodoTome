//
//  TodoTomeApp.swift
//  TodoTome
//
//  Created by PHONG on 18/04/2021.
//

import SwiftUI

@main
struct TodoTomeApp: App {
    @StateObject private var todos = TodoModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(todos)
        }
    }
}
