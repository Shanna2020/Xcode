//
//  HistoryProduct.swift
//  Cash Register Application
//
//  Created by user199511 on 10/25/21.
//

import Foundation
class HistoryProduct{
    
    var name:String
    var quantity: String
    var totalPrice:String
    var purchaseDate:String
        
    init(n:String, q: String, p:String, d:String)
    {
        name=n
        quantity=q
        totalPrice=p
        purchaseDate=d
    }
    
}
