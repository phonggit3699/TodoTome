//
//  TodoView.swift
//  TodoTome
//
//  Created by PHONG on 18/04/2021.
//

import SwiftUI

struct TodoView: View {
    @EnvironmentObject var todoModel: TodoModel
    var todo: Todo
    var todoIndex: Int {
        return todoModel.todos.firstIndex(where: { $0.id == todo.id })!
    }
    var body: some View {
        HStack{
            Image(systemName: "flame.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(todo.isCompleted ? .gray : .yellow)
                .padding()
                .background(todo.isCompleted ? Color.gray.opacity(0.5) : Color.blue.opacity(0.5))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading){
                Text(todo.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .strikethrough(todo.isCompleted)
                    .lineLimit(1)
                Text(todo.content)
                    .font(.subheadline)
                    
                    .strikethrough(todo.isCompleted)
                    .lineLimit(1)
            }.padding(.horizontal, 5)
            .foregroundColor(Color.black.opacity(0.6))
            Spacer()
            HStack{
                Button(action: {
                    withAnimation(.spring()){
                        
                        todoModel.todos[todoIndex].isCompleted.toggle()
                        
                        todoModel.updateTodo()
                    }
                }, label: {
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "checkmark.circle") //checkmark.circle.fill
                        .resizable()
                        .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.green)
                })
                
                Button(action: {
                    withAnimation(.spring()){
                        todoModel.todos.remove(at: todoIndex)
                        
                        todoModel.updateTodo()
                    }
                    
                }, label: {
                    Image(systemName: "trash.circle")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.red)
                })
            }
            
        }.padding()
        .background(todo.isCompleted ? Color.gray.opacity(0.1) : Color.blue.opacity(0.1))
        .clipShape(Capsule())
    }
}

//struct TodoView_Previews: PreviewProvider {
//    static var todos = TodoModel().todos
//    static var previews: some View {
//        TodoView(todo: todos[0]).environmentObject(TodoModel())
//    }
//}
