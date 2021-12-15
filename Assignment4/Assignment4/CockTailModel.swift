//
//  CockTailModel.swift
//  Assignment4
//
//  Created by user199511 on 12/8/21.
//

import Foundation
import UIKit

struct result:Codable{
    public var drinks:[Info]
}

struct Info : Codable{

    var strDrink:String
    var strAlcoholic:String
    var strInstructions:String
    public var strDrinkThumb: String//URL
   }

