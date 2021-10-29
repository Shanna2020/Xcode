//
//  HistoryViewController.swift
//  Cash Register Application
//
//  Created by user199511 on 10/24/21.
//

import UIKit

class HistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var HistroyCVManager:HistoryProductManager?
    var labelString=""
    var position=0;
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  (HistroyCVManager?.getAllproducts().count)! }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text=HistroyCVManager?.getAllproducts()[indexPath.row].name
        
        cell.detailTextLabel?.text=HistroyCVManager?.getAllproducts()        [indexPath.row].quantity
        
        return cell
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        position=indexPath.row
        performSegue(withIdentifier:"toDetailHistory", sender:self)
     
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "toDetailHistory"{
        
        let detailHistory = segue.destination as! DetailHistoryViewController
            detailHistory.Histroydetail=HistroyCVManager?.Historyproducts[position]
            
            print(position)
            
        }else {print("No Manager")}
    }
    
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 /*   func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
  //      [self performanceSegueWithIdentifier:@"toDetailHistory"sender:indexPath];
        
          }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
