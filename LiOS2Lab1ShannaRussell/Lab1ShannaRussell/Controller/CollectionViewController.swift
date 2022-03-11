//
//  CollectionViewController.swift
//  Lab1ShannaRussell
//
//  Created by user214013 on 1/28/22.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. register a cell
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        self.collectionView.backgroundColor = .white
        title = "Collection"
    }
    
    //2. specify where each cell will go on the grid
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //3. create the cell and add to the collection view based on index
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        cell.backgroundView?.backgroundColor = .blue
        
        return cell
    }
    
    //4. Specify the number of sections and number of items
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
   
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row > 0 {
            navigationController?.pushViewController(TableViewController(), animated: true)
        }
    }
}

