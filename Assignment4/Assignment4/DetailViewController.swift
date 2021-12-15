//
//  DetailViewController.swift
//  Assignment4
//
//  Created by user199511 on 12/14/21.
//

import UIKit
import CoreData

class DetailViewController: UIViewController,NSFetchedResultsControllerDelegate {

    var detailInfo:Info?// variable which receive information from segue
    var stringResponse=""

    
    @IBOutlet weak var detailImg: UIImageView!
    
    @IBOutlet weak var displayNamelbl: UILabel!
    
    @IBOutlet weak var displayTypelbl: UILabel!
    
    @IBOutlet weak var displayInstructlbl: UILabel!
    
    
    /////////////////////////cancel button/////////////////////////////////////////////////////////
    @IBAction func cancelbtn(_ sender: Any) {
        
        dismiss(animated: true, completion:nil)
        
        
    }
    
    ///////////////////view did load///////////////////////////////////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        

        displayNamelbl.text=detailInfo?.strDrink
        
        displayTypelbl.text=detailInfo?.strAlcoholic
        
        displayInstructlbl.text = detailInfo?.strInstructions;
        
        
        
        NetworkManager.shared.getImage(url: detailInfo!.strDrinkThumb) { result in
            switch result{
            case .success(let img):
                DispatchQueue.main.async {
                    self.detailImg.image = img
                }
            case .failure(let error):
                print(error)
                
            }
        
        
        
        
        
        
        do{
       try  CordDataManager.shared.fetchedResultController.performFetch()
            CordDataManager.shared.fetchedResultController.delegate = self
            
        }catch {
            
            print (error)
        }
    }
}
    ////////////////////////Heading Label///////////////////////
    
    @IBOutlet weak var InstructLbl: UILabel!
    
   
   //
    //////////////////////////////Save Button////////////////////////////////////////////
    @IBAction func SaveBtnAction(_ sender: Any) {
        if (detailInfo != nil) {
        CordDataManager.shared.saveNewInfo(drink: detailInfo!.strDrink, instructions: detailInfo!.strInstructions, drinkThumb: detailInfo!.strDrinkThumb, alcoholic: detailInfo!.strAlcoholic)
                  
        }else{print("error")}
        
        let alert = UIAlertController.init(title: "Save Status", message: "Saved Successfully", preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
   
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
