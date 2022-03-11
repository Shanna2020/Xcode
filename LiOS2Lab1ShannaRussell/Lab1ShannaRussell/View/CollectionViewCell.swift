//
//  CollectionViewCell.swift
//  Lab1ShannaRussell
//
//  Created by user214013 on 1/28/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Adding an image view
        self.contentView.addSubview(imageView)
        
        //Specify the image we want to use
        imageView.image = UIImage(named: "butterfly")
        imageView.contentMode = .scaleToFill
        
        //give the cell constraints programatically
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //(POSITION - X, Y || SIZE - WIDTH, HEIGHT)
        
        //image view width is equal to width of cell
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
        
        //image view height is equal to height of cell
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
        
        //image view will be centered on x
        imageView.centerXAnchor.constraint(equalToSystemSpacingAfter: self.centerXAnchor, multiplier: 1.0).isActive = true
        
        //image view will be centered on y
        imageView.centerYAnchor.constraint(equalToSystemSpacingBelow: self.centerYAnchor, multiplier: 1.0).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
