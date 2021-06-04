//
//  TodoModel.swift
//  TodoTome
//
//  Created by PHONG on 18/04/2021.
//

import Foundation

struct Todo: Codable, Identifiable {
    var id = UUID().uuidString
    var title: String
    var content: String
    var isCompleted: Bool
}
