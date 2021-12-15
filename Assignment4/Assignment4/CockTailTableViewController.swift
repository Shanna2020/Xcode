//
//  CockTailTableViewController.swift
//  Assignment4
//
//  Created by user199511 on 12/8/21.
//

import UIKit

class CockTailTableViewController: UITableViewController {
 
    var position=0
    var drink:Info?
    lazy var results = [Info]()
    var photo_url :String = ""
    var nameapi:String = "margarita"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getCocktailPackage(name: nameapi){resultsFromAPI in
            
            // access main thread to update the table
            DispatchQueue.main.async {
                self.results = resultsFromAPI
                self.tableView.reloadData()
            }
        }
            
       }
        
  
////Table section
    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }
    
    ///////////////////////////////////////

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return results.count
    }

 //////////////////////////////////////
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = results[indexPath.row]
        cell.textLabel?.text = item.strDrink
        cell.detailTextLabel?.text = item.strAlcoholic
        
        return cell
    }
    /////////////////////////////////////////////////////////////////////////////////
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        position=indexPath.row
        performSegue(withIdentifier:"toDetail", sender:self)
     
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "toDetail"{
        
       let detail = segue.destination as! DetailViewController
            detail.detailInfo=self.results[position]
            
            print(position)
            
        }else {print("Not Selected")}
    }
 }



