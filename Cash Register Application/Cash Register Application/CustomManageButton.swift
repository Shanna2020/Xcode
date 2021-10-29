//
//  CustomManageButton.swift
//  Cash Register Application
//
//  Created by user199511 on 10/24/21.
//

import UIKit

class CustomManageButton: UIButton {
    
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    
    required init?(coder:NSCoder){
        super.init(coder: coder)
        layer.backgroundColor=UIColor.red.cgColor
        layer.borderWidth=1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = layer.frame.height/7
        
    }
}
