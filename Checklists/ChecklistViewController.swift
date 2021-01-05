//
//  ViewController.swift
//  Checklists
//
//  Created by Eric Jang on 2021/01/05.
//

import UIKit

class ChecklistViewController: UITableViewController {

    
    var items = [ChecklistItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        item2.check = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learned iOS development"
        item3.check = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Soccer Practice"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        item5.check = true
        items.append(item5)
        
        let item6 = ChecklistItem()
        item6.text = "Eat sleep code"
        item6.check = true
        items.append(item6)
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return items.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        
        let item = items[indexPath.row]

        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = items[indexPath.row]
            item.check.toggle()
            configureCheckmark(for: cell, with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureText(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    func configureCheckmark(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ) {
        cell.accessoryType = item.check ? .checkmark : .none
    }
}
