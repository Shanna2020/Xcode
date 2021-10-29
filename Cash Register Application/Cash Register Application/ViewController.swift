//
//  ViewController.swift
//  Cash Register Application
//
//  Created by user199511 on 10/13/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
     
    @IBOutlet weak var Table_handler: UITableView!
    var productManager = ProductManager()
    var products =  [Product]()
    var productHistory = [HistoryProduct]()
    var productHistoryManager=HistoryProductManager()
    var balanceString=""
    var priceString:String=""
    var display:String=""
    var cashRegisterManager = CashRegisterCal()
    var quantityString=""
    var nameString=""
    var position=0
  

    @IBOutlet weak var managerBtn: CustomManageButton!
    
    @IBOutlet weak var productlabel: UILabel!
    @IBOutlet weak var quantitylabel: UILabel!
    @IBOutlet weak var Totallabel: UILabel!
    
    @IBOutlet weak var navigateToManager: CustomManageButton!
    
    //returns the number of items and creste appropriate rows///////////////////
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products=productManager.getAllproducts()
        return products.count    }
    //returns the number of selection
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    ////Selected cell values are placed into labels and strings//////////////////////////
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath) as! myCustomTableViewCell
        nameString=currentCell.nameLabel!.text!
        productlabel.text=nameString
        balanceString=currentCell.quantityLabel.text!
        priceString = String(products[indexPath.row].price)
        position=indexPath.row
        
    }
    
    //////Function makes the cells reusable and assigns adjusted information to the table cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! myCustomTableViewCell
        
        cell.nameLabel?.text=products[indexPath.row].name//
        cell.quantityLabel?.text=String(products[indexPath.row].quantity)
        cell.priceLabel.text=String(products[indexPath.row].price)
        
        return cell
        
    }
    
   
    @IBAction func NavToManager(_ sender: Any) {
   print()
        
        
    }
    
    /////////////////establishes the connection  to Manage Panel by using segue and assigning value to manager Panel variable
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // segue.identifier to "toManagerPanel"
        
       let ManagerPanelVC = segue.destination as! ManagerPanelViewController
            ManagerPanelVC.ManagerCV=productHistoryManager
            ManagerPanelVC.ManagerRestoreVC=products
        
        
        
    }
    
    ////////////////////////Key Pad Action Function ///////////////////////////////////////////////////////////////////////////////////////////////////////
    @IBAction func keyPad_handler(_ sender: Any) {
        
        if (sender as! UIButton).tag == 1//Buy Button selected
        {
            if(nameString.isEmpty || quantityString.isEmpty)//check empty value
            {//assigning alert Controller
                let alert=UIAlertController(title: "Error", message: "You have not Entered Quantity or Name of Product", preferredStyle: .alert)
                //assigning alert action
                let action1=UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action1)//adding action to alert
                //present allow display to the broweser
                present(alert, animated: true, completion: nil)
                resetDisplay()
                
            }else{//getting the result
               let Result = cashRegisterManager.total(price:priceString, quantity:quantityString, balance:balanceString)
                if(Result.0 == -1)//should amount entered is more than balnce
                {
                    let alert=UIAlertController(title: "Error", message: "Insufficient Quantity. Enter less Amount", preferredStyle: .alert)
                    
                    let action1=UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action1)
                    present(alert, animated: true, completion: nil)
                    resetDisplay()

                }else{
                    //should calculation be successful, you assign value to appropriate labels snd reload table
                    Totallabel.text=String(Result.0)
                    balanceString=String(Result.1)
                    products[position].quantity=Result.1
                    Table_handler.reloadData()
                   
                        //History information is populated
                    productHistoryManager.addNewHistory(newHistoryProduct: HistoryProduct(n: nameString,q: quantityString,p: String(Result.0), d: purchaseDate()))
                    
                    productHistory = productHistoryManager.getAllproducts()
                    
                    
                    //reset
                    resetDisplay()
                }
                
                
            }//end else
            
        }else{
       //getting value from button
        quantityString += ((sender as! UIButton).titleLabel!.text ?? "Error")
        quantitylabel.text = quantityString
        }
           
        
    }//End of keyPad
    
    /////////////reset Display///////////////////////////////////////////////////////////////
    func resetDisplay()
    {
        quantityString=""
        nameString=""
        priceString=""
        
        quantitylabel.text = "Quantity"
        productlabel.text="Type"
        
    }
    
  ///////////////Date//////////////////////////////////////////////////////
    
    func purchaseDate()->String
    {
        let now = Date()

        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        let datetime = formatter.string(from: now)
        return datetime
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Table_handler.reloadData()
        
    }

  
}

