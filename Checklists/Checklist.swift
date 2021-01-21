//
//  Checklist.swift
//  Checklists
//
//  Created by Eric Jang on 2021/01/11.
//

import UIKit

class Checklist: NSObject, Codable {
    var name: String
    var items = [ChecklistItem]() 
    init(name: String) {
        self.name = name
        super.init()
    }
}
