//
//  ProductManager.swift
//  Cash Register Application
//
//  Created by user199511 on 10/24/21.
//

import Foundation
class ProductManager{
 var products = [Product]()

init(){
        products.append(Product(n: "Hat", q: 10, p: 3))
        products.append(Product(n: "Pants", q: 20, p: 4))
        products.append(Product(n: "Tshirt", q: 10, p: 3))
        products.append(Product(n: "Dresses", q: 24, p: 4))
        products.append(Product(n: "Shoes", q: 50, p: 3))
}

func addNewProduct(newProduct: Product){

products.append(newProduct)

}

func getAllproducts()->[Product]{

return products}

}

