//
//  TableViewController.swift
//  Lab1ShannaRussell
//
//  Created by user214013 on 1/28/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    //cell
    var cell: UITableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Register our cell
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        self.view.backgroundColor = .white
        
        
    }
    
    
    
    //2. Specify what row the cell will go
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //3. create the cell and add to the table based on index
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) 
        
        cell.textLabel?.text = "New e-mail awaits"
        
        return cell
    }
    
    //4. number of rows in each section
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 2 {
            
            navigationController?.pushViewController(TabViewController(), animated: true)
        }
    }
    
}
