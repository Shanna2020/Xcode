//
//  ViewController.swift
//  Assignment4
//
//  Created by user199511 on 12/8/21.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.HomedisplayImg.image=UIImage.init(named:"cocktailImg")
    }
   
    @IBOutlet weak var nametxt: UITextField!
    
    @IBAction func viewCocktailBtn(_ sender: Any) {
        
        performSegue(withIdentifier:"toAPIList", sender:self)
    }
    
    @IBOutlet weak var HomedisplayImg: UIImageView!
    
    @IBAction func ViewFavaouriteBtn(_ sender: Any) {
    }
    
    /////////////////////////////Segue to go to  cocktailVC/////////////////////////////////////////////////////
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "toAPIList"{
        
       let name = segue.destination as! CockTailTableViewController
            name.nameapi=(nametxt.text)!//(sender as! UIButton).titleLabel!.text ??//"margarita"
                    
        }else {print("Not Seen")}
}

}
