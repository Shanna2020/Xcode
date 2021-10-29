//
//  ManagerPanelViewController.swift
//  Cash Register Application
//
//  Created by user199511 on 10/24/21.
//

import UIKit

class ManagerPanelViewController: UIViewController {
    
    var ManagerCV:HistoryProductManager?
    var ManagerRestoreVC=[Product]()
   
    
    @IBAction func HistortyButton(_ sender: Any) {
        
       // print(ManagerCV?.getAllproducts()[0].name ?? "Value")
        
     //   print(ManagerRestoreVC[1].quantity)
        
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
                
        if segue.identifier == "toHistory"{
            let historyVC = segue.destination as! HistoryViewController
            
            historyVC.HistroyCVManager=ManagerCV!
            
        } else if segue.identifier == "toRestock"{
            let restockVC = segue.destination as! RestockViewController
            
            restockVC.ManagerRestoreVC2=ManagerRestoreVC
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    }
}
