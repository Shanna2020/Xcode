//
//  HistoryProductManager.swift
//  Cash Register Application
//
//  Created by user199511 on 10/25/21.
//

import Foundation
class HistoryProductManager
{
    var Historyproducts = [HistoryProduct]()

   init(){
          
   }

   func addNewHistory(newHistoryProduct: HistoryProduct){

   Historyproducts.append(newHistoryProduct)

   }

   func getAllproducts()->[HistoryProduct]{

   return Historyproducts}

   }


