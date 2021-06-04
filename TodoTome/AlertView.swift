//
//  AlertView.swift
//  TodoTome
//
//  Created by PHONG on 22/04/2021.
//

import SwiftUI

struct AlertView: View {
    @EnvironmentObject var todoModel: TodoModel
    @State var showAlert = false
    var body: some View {
        VStack{
            Button(action: {
                todoModel.CustomAlert()
                self.showAlert.toggle()
            }, label: {
                Label("Press here", systemImage: "play.fill")
            })
        }.alert(isPresented: self.$showAlert, content: {
            Alert(title: Text("Alert"), message: Text("Alert message"), dismissButton: .default(Text("OK")))
        })
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView().environmentObject(TodoModel())
    }
}
