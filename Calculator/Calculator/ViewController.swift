//
//  ViewController.swift
//  Calculator
//
//  Created by user199511 on 9/25/21.
//

import UIKit

class ViewController: UIViewController {

    var calculatorclass = CalculatorClass()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBOutlet weak var historyLabel: UILabel!
    
 //initalization of variable///////////////////
    
   
    var displayString:String=""
    var historyString=""
    var mode = false
    var errVar = 9999999

    
    @IBAction func click_handler(_ sender: Any) {
      
    //if the standard/advance button is clicked
        if (sender as! UIButton).tag == 16{ //mode button
            mode=calculatorclass.mode()// call calculator mode function
            if mode==true
            { //change label if advance is selected
              (sender as! UIButton).setTitle("Advance - History ", for: .normal)
                historyLabel.isHidden=false
                
            }else{ //Change label if standard is selected
          
                (sender as! UIButton).setTitle("Standard - No History", for: .normal)
                historyLabel.isHidden=true

            } //end else
        } //end tag 16 if statement
        else{
            
        if (sender as! UIButton).tag == 11//equal sign selected
        {
            let finalCal:Int = calculatorclass.calc()// call to calc function
            
            if finalCal == errVar // error number to check
            {
                displayString = ""
                displayString += "Error"
                displayLabel.text = displayString
                clearFunction()
              
            }//end if
            else{ //add equal sign to display string and add string to label
                displayString += "=" + String(finalCal)
                displayLabel.text = displayString
            
                if mode==true{ //if mode is true add display string to history string
                historyString += "\n \(displayString)"
                
                historyLabel.text = historyString
                
                    } // end if mode
                clearFunction() //clear strings
            
            }// end else
        }else if(sender as! UIButton).tag == 9 //clear button
            {
          clearFunction()
          displayLabel.text = ""
            }
        else{
            // call calculator push function to add text
            calculatorclass.push(data: (sender as! UIButton).titleLabel!.text ?? "Error")
                   
            //add to string and label
            displayString += ((sender as! UIButton).titleLabel!.text ?? "Error")
            displayLabel.text = displayString
            
        }//end else
    }//end out if
        
    }//end click_handle function
    
    ///////////////////////ClearFunction///////////////
    func clearFunction(){
        displayString=""
        calculatorclass.pop() //clear array
    }
    
 
    ///////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }// end viewDidLoan


}

