//
//  AddItemViewControllerDelegate.swift
//  ToDoList
//
//  Created by Amanda Demetrio on 9/13/18.
//  Copyright © 2018 Amanda Demetrio. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemViewControllerDelegate {
    func sendTaskToMainViewController (_ controller: AddItemViewController, _ taskName: String, _ taskNotes: String, _ datePicker: Date)
}
