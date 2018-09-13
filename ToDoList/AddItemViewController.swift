//
//  AddItemViewController.swift
//  ToDoList
//
//  Created by Amanda Demetrio on 9/12/18.
//  Copyright © 2018 Amanda Demetrio. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    var delegate: AddItemViewControllerDelegate?
    
    var taskName: String?
    @IBOutlet weak var taskNameTextField: UITextField!
    
    var taskNotes: String?
    @IBOutlet weak var taskNotesTextField: UITextField!
    
    var datePicked: Date?
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func datePickerSelected(_ sender: UIDatePicker) {
        self.view.endEditing(true)
        datePicked = sender.date
    }
    
    @IBOutlet weak var addItemButton: UIButton!
    
    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        taskName = taskNameTextField.text
        taskNotes = taskNotesTextField.text
        delegate?.sendTaskToMainViewController(self,taskName!,taskNotes!,datePicked!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskNameTextField.placeholder = "Task Name"
        taskNotesTextField.placeholder = "Task Notes"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
