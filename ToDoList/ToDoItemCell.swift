//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Amanda Demetrio on 9/12/18.
//  Copyright © 2018 Amanda Demetrio. All rights reserved.
//

import UIKit

protocol ItemCellDelegate {
    func markingTaskAsDone(_ indexPath: IndexPath)
}

class ToDoItemCell: UITableViewCell {
    
    var delegate: ItemCellDelegate!
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskNotesLabel: UILabel!
    @IBOutlet weak var taskDateLabel: UILabel!
    
}
