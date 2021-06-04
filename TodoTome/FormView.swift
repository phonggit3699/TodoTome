//
//  FormView.swift
//  TodoTome
//
//  Created by PHONG on 27/04/2021.
//

import SwiftUI

struct FormView: View {
    @State var userName = ""
    
    var body: some View {
        VStack {
            Form{
                HStack {
                    Image(systemName: "person.and.arrow.left.and.arrow.right")
                    TextField("User name", text: self.$userName)
                }
                HStack {
                    Image(systemName: "person.and.arrow.left.and.arrow.right")
                    TextField("User name", text: self.$userName)
                }
                
            }
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Login")
            })
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
