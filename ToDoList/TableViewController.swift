//
//  TableViewController.swift
//  ToDoList
//
//  Created by Amanda Demetrio on 9/12/18.
//  Copyright © 2018 Amanda Demetrio. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, AddItemViewControllerDelegate {
    
    var tasks = [ToDoItem]()
    
    //Stagging area for stuff to be added to Core Data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addItemViewController = segue.destination as! AddItemViewController
        addItemViewController.delegate = self as AddItemViewControllerDelegate
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "ListToAddSegue", sender: nil)
    }
        
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()
        fetchAllItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! ToDoItemCell
        cell.taskTitleLabel.text = tasks[indexPath.row].taskName
        cell.taskNotesLabel.text = tasks[indexPath.row].descriptionOfTask
        //Fixing date format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateToFormat = dateFormatter.string(from: tasks[indexPath.row].dueDate!)
        cell.taskDateLabel.text = dateToFormat
        
        if tasks[indexPath.row].isChecked == true {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tasks[indexPath.row].isChecked == false {
            tasks[indexPath.row].isChecked = true
        }
        else if tasks[indexPath.row].isChecked == true {
            tasks[indexPath.row].isChecked = false
        }
        tableView.reloadData()
    }
    
    func fetchAllItems() {
        let taskRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoItem")
        do {
            let results = try context.fetch(taskRequest)
            tasks = results as! [ToDoItem]
        }
        catch {
            print("\(error)")
        }
    }
    
    func sendTaskToMainViewController(_ controller: AddItemViewController, _ taskName: String, _ taskNotes: String, _ datePicker: Date) {
        let newTask = ToDoItem(context: context)
        newTask.taskName = taskName
        newTask.descriptionOfTask = taskNotes
        newTask.dueDate = datePicker
        newTask.isChecked = false
        tasks.append(newTask)
        tableView.reloadData()
        saveContext()
        dismiss(animated: true, completion: nil)
    }

}
