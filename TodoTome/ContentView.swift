//
//  ContentView.swift
//  TodoTome
//
//  Created by PHONG on 18/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TodoListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TodoModel())
    }
}
