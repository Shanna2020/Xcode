//
//  RestockViewController.swift
//  Cash Register Application
//
//  Created by user199511 on 10/24/21.
//

import UIKit

class RestockViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    var ManagerRestoreVC2=[Product]()
    var productManager = ProductManager()
 
    
    var nameString=""
    var balanceString=""
    var quantityString=""
    var position=0
    
  
    
    
    @IBOutlet weak var RestockTable: UITableView!
    
    @IBOutlet weak var ProductNameTxt: UITextField!
    var cashRegisterManager=CashRegisterCal()
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productManager.products=ManagerRestoreVC2
        print(productManager.getAllproducts()[0].quantity)
        return productManager.getAllproducts().count    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text=productManager.getAllproducts()[indexPath.row].name//
        cell.detailTextLabel?.text=String(productManager.getAllproducts()[indexPath.row].quantity)
        

        return cell    }
    
   
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        nameString=currentCell.textLabel!.text!
        balanceString=currentCell.detailTextLabel!.text!
        position=indexPath.row
        
    }
    ///////Reload function checks if string is empty and gives an alert if it is true, otherwise, it updates the balance and assign informaion to the product by way of the manager and reload the table////////////////////////////////////////////////////////
    @IBAction func restockButton_Action(_ sender: Any) {
        if (sender as! UIButton).tag == 1//equal sign selected
        {
            quantityString=ProductNameTxt.text ?? ""
            if(nameString.isEmpty || quantityString.isEmpty)
            {
                let alert=UIAlertController(title: "Error", message: "You have not Entered Quantity or Name of Product", preferredStyle: .alert)
                
                let action1=UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action1)
                present(alert, animated: true, completion: nil)
                
            }else{
               let Result = cashRegisterManager.update(quantity:quantityString, balance:balanceString)
                
                    balanceString=String(Result)
                    productManager.getAllproducts()[position].quantity=Result
                    RestockTable.reloadData()
                    ProductNameTxt.text = ""
                }
        }else{
            _ = navigationController?.popViewController(animated: true)

            
        }//end if
}//end action button
    //////////////////////////////////////////////////////////////////////////////////
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
                
        // Do any additional setup after loading the view.
    }
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
