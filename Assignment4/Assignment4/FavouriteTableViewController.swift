//
//  FavouriteTableViewController.swift
//  Assignment4
//
//  Created by user199511 on 12/14/21.
//

import UIKit
import CoreData

class FavouriteTableViewController: UITableViewController,NSFetchedResultsControllerDelegate {
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do{
       try  CordDataManager.shared.fetchedResultController.performFetch()
            CordDataManager.shared.fetchedResultController.delegate = self
            
        }catch {
            
            print (error)
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
     
        guard let sections = CordDataManager.shared.fetchedResultController.sections else {
            return 0
        }
        return sections.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CordDataManager.shared.fetchedResultController.fetchedObjects!.count

        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        var drinkInfo : Infod?
            
       drinkInfo  = CordDataManager.shared.fetchedResultController.object(at: indexPath)
        cell1.textLabel?.text = drinkInfo!.drink
        cell1.detailTextLabel?.text = drinkInfo!.instructions
            return cell1
        
        
        }

}
