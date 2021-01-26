//
//  Checklist.swift
//  Checklists
//
//  Created by Eric Jang on 2021/01/11.
//

import UIKit

class Checklist: NSObject, Codable {
    var iconName = "No Icon"
    var name: String
    var items = [ChecklistItem]() 
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    func sortItems() {
        items.sort { item1, item2 in
            return item1.dueDate < item2.dueDate
        }
    }
    
    func countUncheckedItems() -> Int {
        return items.filter{ !$0.check }.count
    }
}
