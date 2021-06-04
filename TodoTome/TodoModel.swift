//
//  TodoModel.swift
//  TodoTome
//
//  Created by PHONG on 18/04/2021.
//

import Foundation
import SwiftUI
import UIKit

class TodoModel: ObservableObject {
    
    @Published var todos:[Todo] = []
    
    @Published var todoToJson: [Todo]?
    
    
    func addTodo (todo: Todo){
        self.todos.insert(todo, at: 0)
        saveDatatoJsonFile()
//        UserDefaults.standard.set(try? PropertyListEncoder().encode(self.todos), forKey: "saveTodo")
    }
    
    func modifyTodo(todo: Todo, index: Int){
        self.todos.insert(todo, at: index)
        self.todos.remove(at: (index + 1))
        saveDatatoJsonFile()
//        UserDefaults.standard.set(try? PropertyListEncoder().encode(self.todos), forKey: "saveTodo")
    }
    
    func updateTodo() {
        saveDatatoJsonFile()
//        UserDefaults.standard.set(try? PropertyListEncoder().encode(self.todos), forKey: "saveTodo")

    }
    
    func getSavedTodo(){
        guard let data = UserDefaults.standard.value(forKey: "saveTodo") as? Data else { return }
        
        if let todo = try? PropertyListDecoder().decode([Todo].self, from: data){
            DispatchQueue.main.async {
                self.todos = todo
                
            }
        }
        
    }
    
    
    //Custome Alert View
    func CustomAlert() {
        let customAlert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            let result = customAlert.textFields![0].text
            
            print (result!)
        }
        
        customAlert.addAction(cancel)
        customAlert.addAction(ok)
        customAlert.addTextField { (txt) in
            txt.placeholder = "OTP"
        }
        UIApplication.shared.windows.first?.rootViewController?.present(customAlert, animated: true, completion: nil)
        print("Custom Alert")
    }
    
    func converttoJson(todo: [Todo]) -> String{
        do{
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(todo)
            guard let json = String(data: jsonData, encoding: String.Encoding.utf8) else{ return ""}
            return json
        }
        catch{
            print(error.localizedDescription)
            return ""
        }
    }
    
    func saveDatatoJsonFile () {
        
        let todoString = converttoJson(todo: self.todos)
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                            in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent("data.json")
            do {
                try todoString.write(to: pathWithFilename,
                                     atomically: true,
                                     encoding: .utf8)
                print("write sucessfully")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getDatafromJsonFile(){
        
        if let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileName = file.appendingPathComponent("data.json")
            
            guard let data = try? Data(contentsOf: fileName) else {
                return
            }

            do {
                let decoder = JSONDecoder()
                self.todos = try decoder.decode([Todo].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
        else {
            print("Couldn't get url file")
        }
    }
}
