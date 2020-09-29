//
//  ToDoListTableViewController.swift
//  subclassing_tableViewController
//
//  Created by swapnil jadhav on 24/09/20.
//  Copyright © 2020 t. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

    var ItemArray = ["Home","News","About"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return ItemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = ItemArray[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //tableView.deselectRow(at:indexPath,animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .some(.checkmark)
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else
        {

        
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }

    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "Add Item", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            
            self.ItemArray.append(textField.text!)
            
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
