//
//  CashRegisterCal.swift
//  Cash Register Application
//
//  Created by user199511 on 10/24/21.
//

import Foundation

class CashRegisterCal{
    
    //Total Function////////////////////////////////////////////////////
       
    func total(price:String,quantity:String, balance:String)->(Double, Int)
    {
        var Price=0.0
        var Total = 0.0
        let Amount = Int(quantity)!
        var  Balance = Int(balance)!
        if(Balance<Amount)
        {
            Total = -1
        }else{
        Price=Double(price)!
        Total = Double(Amount) * Price
        Balance=Balance-Amount
        
        }
        return (Total,Balance)

        }
////////////Update quantity////////////////////////////////////////////////////////////////////////////////////////////////////
    func update(quantity:String, balance:String)->(Int)
    {

        let Amount = Int(quantity)!
        var  Balance = Int(balance)!
    
        Balance+=Amount
        
        
        return Balance

        }//end of update


    

}
