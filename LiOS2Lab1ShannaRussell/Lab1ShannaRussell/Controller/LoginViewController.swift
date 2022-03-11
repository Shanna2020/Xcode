//
//  LoginViewController.swift
//  Lab1ShannaRussell
//
//  Created by user214013 on 1/29/22.
//

import UIKit

class LoginViewController: UIViewController {

    //UI Elements
    var loginbutton: UIButton?
    var instructlabel: UILabel?
    var userlabel: UILabel?
    var usertxt: UITextField?
    var passwordtxt: UITextField?
    var passwordlabel: UILabel?
    var butterflyImg: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
       
        
       
        //Butterfly Image
         butterflyImg = UIImageView(image: UIImage(named: "butterfly"))
         self.view.addSubview(butterflyImg!)
         
         butterflyImg?.translatesAutoresizingMaskIntoConstraints = false
         butterflyImg?.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 15.0).isActive = true
         butterflyImg?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 1.0).isActive = true
         butterflyImg?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
         butterflyImg?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        
        
        //login button
        
        loginbutton = UIButton()
        loginbutton?.setBackgroundImage(UIImage(named: "loginbtn"), for: .normal)
        self.view.bringSubviewToFront(loginbutton!)
        
        loginbutton?.imageView?.contentMode = .scaleAspectFit
        self.view.addSubview(loginbutton!)
        
        //adding a target for our button gesture
        loginbutton?.addTarget(self, action: #selector(backToPrev), for: .touchUpInside)
        
        loginbutton?.translatesAutoresizingMaskIntoConstraints = false
        
        //x
        loginbutton?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true
        //y
        loginbutton?.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: view.centerYAnchor, multiplier: 0.5).isActive = true
        
        //height
        loginbutton?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        //width
        loginbutton?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
       
        //MARK: - Label
        
        //Attributes
        userlabel = UILabel()
        userlabel?.text = "User Name"
        userlabel?.font = UIFont(name: "Verdana", size: 15)
        userlabel?.textColor = .black
        userlabel?.numberOfLines = 0
        userlabel?.textAlignment = .center
        userlabel?.adjustsFontSizeToFitWidth = true
        userlabel?.sizeToFit()
        self.view.addSubview(userlabel!)
        
        //Constraints for label
        userlabel?.translatesAutoresizingMaskIntoConstraints = false
        //y
        userlabel?.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 25.0).isActive = true
        userlabel?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 6.0).isActive = true
        userlabel?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        userlabel?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        
        //passwordlabel
        
        //Attributes
        passwordlabel = UILabel()
        passwordlabel?.text = "Password"
        passwordlabel?.font = UIFont(name: "Verdana", size: 15)
        passwordlabel?.textColor = .black
        passwordlabel?.numberOfLines = 0
        passwordlabel?.textAlignment = .center
        passwordlabel?.adjustsFontSizeToFitWidth = true
        passwordlabel?.sizeToFit()
        self.view.addSubview(passwordlabel!)
        
        //Constraints for label
        passwordlabel?.translatesAutoresizingMaskIntoConstraints = false
        //y
        passwordlabel?.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 35.0).isActive = true
        passwordlabel?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 6.0).isActive = true
        passwordlabel?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        passwordlabel?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        
        //Attributes
        instructlabel = UILabel()
        instructlabel?.text = "Enter User Name and Password, then Click Login Button to Sign In"
        instructlabel?.font = UIFont(name: "Verdana", size: 12)
        instructlabel?.textColor = .systemGreen
        instructlabel?.numberOfLines = 0
        instructlabel?.textAlignment = .center
        instructlabel?.adjustsFontSizeToFitWidth = true
        instructlabel?.sizeToFit()
        self.view.addSubview(instructlabel!)
        
        //Constraints for label
        instructlabel?.translatesAutoresizingMaskIntoConstraints = false
        
        instructlabel?.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: loginbutton!.topAnchor, multiplier: 5.5).isActive = true
        instructlabel?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true
        instructlabel?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        instructlabel?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        
        
        //textfield
        //MARK: - textfield
        
        //Attributes
        usertxt = UITextField ()//frame: CGRect(x:10, y:320, width: 300.00,height:30.0))
       // usertxt?.sizeToFit()
        
        usertxt?.placeholder="user"
        usertxt?.borderStyle = UITextField.BorderStyle.line
        usertxt?.backgroundColor = UIColor.white
        usertxt?.textColor = UIColor.blue
        
        self.view.addSubview(usertxt!)
    
       //Constraints for label
        usertxt?.translatesAutoresizingMaskIntoConstraints = false
        //y
        usertxt?.topAnchor.constraint(equalToSystemSpacingBelow: userlabel!.topAnchor, multiplier: 8).isActive = true
        usertxt?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true
        usertxt?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        usertxt?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03).isActive = true
        
        
        
        
        //
        passwordtxt = UITextField ()//frame: CGRect(x:10, y:320, width: 300.00,height:30.0))
       // usertxt?.sizeToFit()
        
        passwordtxt?.placeholder="password"
        passwordtxt?.borderStyle = UITextField.BorderStyle.line
        passwordtxt?.backgroundColor = UIColor.white
        passwordtxt?.textColor = UIColor.blue
        
        self.view.addSubview(passwordtxt!)
    
       //Constraints for label
        passwordtxt?.translatesAutoresizingMaskIntoConstraints = false
        //y
        passwordtxt?.topAnchor.constraint(equalToSystemSpacingBelow: passwordlabel!.topAnchor, multiplier: 8).isActive = true
        passwordtxt?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true
        passwordtxt?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        passwordtxt?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03).isActive = true
        
    }
    
    @objc func backToPrev() {
        //MARK: - Button will push us back last VC
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
}
