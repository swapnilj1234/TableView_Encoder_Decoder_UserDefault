//
//  ToDoListTableViewController.swift
//  subclassing_tableViewController
//
//  Created by swapnil jadhav on 24/09/20.
//  Copyright © 2020 t. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

    var ItemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let newItem = Item()
        newItem.title = "Home"
        newItem.done = true
        ItemArray.append(newItem)
        
        
        
        let newItem1 = Item()
        newItem1.title = "News"
        ItemArray.append(newItem1)
        

        
//       if let item = defaults.value(forKey: "TodoeyList") as? [String]
//       {
//
//        ItemArray = item
//
//        }
        
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return ItemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = ItemArray[indexPath.row].title
        
        if ItemArray[indexPath.row].done == true
        {
            cell.accessoryType = .checkmark
            
        }
        else
        {
            cell.accessoryType = .none
        }
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //tableView.deselectRow(at:indexPath,animated: true)
        
        
        
        ItemArray[indexPath.row].done = !ItemArray[indexPath.row].done
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .some(.checkmark)
//        {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }
//        else
//        {
//
//        
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        
        tableView.reloadData()
    }

    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "Add Item", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            
            
            let newItem = Item()
            newItem.title = textField.text!
            
            
//            self.ItemArray.append(textField.text!)
            
            
            self.ItemArray.append(newItem)
            
            self.defaults.set(self.ItemArray, forKey: "TodoeyList1")
            
            self.tableView.reloadData()
         
            
        }
        
        
        alert.addTextField { (alertText) in
            
            alertText.placeholder = "Enter name"
            
            textField = alertText
        }
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}
