//
//  DetailHistoryViewController.swift
//  Cash Register Application
//
//  Created by user199511 on 10/24/21.
//

import UIKit

class DetailHistoryViewController: UIViewController {
   
    var Histroydetail:HistoryProduct?// variable which receive information from segue
    var stringResponse=""
       
     @IBOutlet weak var displayLabel: UILabel!
    
    //information is assigned to a label and displayed/////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        stringResponse+=Histroydetail!.name
        stringResponse+="\n"
        stringResponse+=Histroydetail!.quantity
        stringResponse+="\n"
        stringResponse+=Histroydetail!.purchaseDate
        stringResponse+="\n"+"Total amount: "
        stringResponse+=Histroydetail!.totalPrice

        
        displayLabel.text=stringResponse
        // Do any additional setup after loading the view.
    }
    
   /*  // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
