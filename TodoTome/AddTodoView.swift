//
//  AddTodoView.swift
//  TodoTome
//
//  Created by PHONG on 18/04/2021.
//

import SwiftUI

struct AddTodoView: View {
    
    @State private var title = ""
    @State private var content = "Description"
    @State private var date = Date()
    @Binding var hiddenAddTodo: Bool
    @Binding var todoUpdate: Todo?
    @EnvironmentObject var todoModel: TodoModel
    var todoIndex: Int {
        if self.todoUpdate != nil{
            return todoModel.todos.firstIndex(where: { $0.id == todoUpdate!.id })!
        }
        else{
            return 0
        }
    }
    
    var body: some View {
        VStack(spacing: 25){
            Text(self.todoUpdate != nil ? "UPDATE TODO" : "ADD NEW TODO")
                .font(.title2)
            HStack{
                Image(systemName: "t.bubble.fill")
                TextField("Title",  text: self.$title)
            }.padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(Color.blue.opacity(0.6), lineWidth: 2))
            
            HStack{
                TextEditor(text: self.$content)
                    .frame(height: 200)
            }.padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(Color.blue.opacity(0.6), lineWidth: 2))
            
            DatePicker("At date", selection: self.$date)
            
            Button(action: {
                if todoUpdate != nil{
                    todoModel.modifyTodo(todo: Todo(title: self.title, content: self.content, isCompleted: false), index: todoIndex)
                }
                else{
                    todoModel.addTodo(todo: Todo(title: self.title, content: self.content, isCompleted: false))
                }
                self.todoUpdate = nil
                self.hiddenAddTodo.toggle()
                todoModel.getDatafromJsonFile()
            }, label: {
                Text(self.todoUpdate != nil ? "Update todo" : "Add todo")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue.opacity(0.6))
                    .clipShape(Capsule())
            })
        
        }.padding()
        .onAppear(perform: {
            self.title = self.todoUpdate?.title ?? ""
            self.content = self.todoUpdate?.content  ?? "Descripton"
        })
    }
    
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(hiddenAddTodo: .constant(false), todoUpdate: .constant(nil))
    }
}
