//
//  TodoListView.swift
//  TodoTome
//
//  Created by PHONG on 18/04/2021.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var todoModel: TodoModel
    @State private var showAddTodo = false
    @State private var filterTodoMode = "All"
    @State var todoUpdate:Todo?
    
    
    
    var body: some View {
        NavigationView{
            VStack {
                
                Picker("Filter todo", selection: self.$filterTodoMode ) {
                    Text("All").tag("All")
                    Text("Done").tag("Done")
                    Text("Not Done").tag("Not Done")
                }
                .pickerStyle(SegmentedPickerStyle())
                
                
                
                ScrollView{
                    LazyVStack {
                        ForEach(self.filterTodoMode == "All" ? todoModel.todos : todoModel.todos.filter{
                            self.filterTodoMode == "Done" ? $0.isCompleted == true : $0.isCompleted == false
                        }){ todo in
                            TodoView(todo: todo).padding(.top, 10)
                                .contextMenu(ContextMenu(menuItems: {
                                    Button(action: {
                                        self.todoUpdate = todo
                                        self.showAddTodo.toggle()
                                    }, label: {
                                        Text("Edit")
                                    })
                                }))
                        }
                    }
                }.zIndex(1)
                
                
            }.navigationTitle("TODOS")
        }
        .sheet(isPresented: self.$showAddTodo,onDismiss: self.restetTodoUpdate ,content: {
            AddTodoView(hiddenAddTodo: self.$showAddTodo, todoUpdate: self.$todoUpdate)
        })
        .onAppear {
            todoModel.getDatafromJsonFile()
        }
        .overlay(
            Button(action: {
                self.showAddTodo.toggle()
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(Color.blue.opacity(0.6)).padding()
            }), alignment: .bottomTrailing)
        .padding()
    }
    
    func restetTodoUpdate() {
        self.todoUpdate = nil
    }
    
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView().environmentObject(TodoModel())
    }
}
