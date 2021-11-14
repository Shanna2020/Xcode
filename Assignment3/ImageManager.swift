//
//  ImageManager.swift
//  Assignment3
//
//  Created by user199511 on 11/9/21.
//

import Foundation

class ImageManager{
    
    var listOfImage = [ImageInfo]()
    
    func addNewImage(newImg:ImageInfo){
        
        listOfImage.append(newImg)
        
    }
    
    func getAllImage()->[ImageInfo]{
        
        return listOfImage
        
    }
    
}
