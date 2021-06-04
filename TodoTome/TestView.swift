//
//  TestView.swift
//  TodoTome
//
//  Created by PHONG on 19/04/2021.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var testModel: TodoModel
    var body: some View {
        
        
//        VStack {
//            HStack{
//                Spacer()
//
//                EditButton()
//            }
//            List{
//                ForEach(1..<20){ ele in
//                    Text("Test")
//
//                }.onDelete(perform: { indexSet in
//
//                }).onMove(perform: { indices, newOffset in
//
//                })
//            }
//        }.padding()
//        .animation(.spring())
        
        Button(action: {
           
        }, label: {
            Text("Convert")
        })
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().environmentObject(TodoModel())
    }
}
