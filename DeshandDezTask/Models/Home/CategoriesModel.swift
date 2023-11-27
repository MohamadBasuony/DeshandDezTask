//
//  CategoriesModel.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 27/11/2023.
//

import Foundation

class CategoryModel : Hashable , Identifiable {
    
    var id = UUID().uuidString
    var name : String?
    var data : [String]?
    init(name: String? = nil, data: [String]? = nil) {
        self.name = name
        self.data = data
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: CategoryModel, rhs: CategoryModel) -> Bool {
        lhs.id > rhs.id
    }
}
