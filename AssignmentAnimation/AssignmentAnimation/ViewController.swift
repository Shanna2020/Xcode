//
//  ViewController.swift
//  AssignmentAnimation
//
//  Created by user214013 on 2/20/22.
//

import UIKit

class ViewController: UIViewController {

        var logoImg: UIImageView?
      
        var mobileButtonImg: UIImageView?
        var instructlabel: UILabel?
        
        var verifybtn:UIButton?
    
        var passwordtxt: UITextField?
    
        var usertxt: UITextField?
    
        var confirmpasswordtxt:UITextField?
    
       
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
         
            self.view.backgroundColor = .white
            
            
            logoImg = UIImageView(image: UIImage(named: "group1"))

            view.addSubview(logoImg!)
        
            logoImg?.translatesAutoresizingMaskIntoConstraints = false
            logoImg?.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0.5).isActive = true
            
            logoImg?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 1.0).isActive = true
            logoImg?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90).isActive = true
            logoImg?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50).isActive = true
            
            
            instructlabel = UILabel()
            instructlabel?.text = "Password and Confirm Password must be the same inorder to proceed"
            instructlabel?.font = UIFont(name: "Verdana", size: 12)
            instructlabel?.textColor = .black
            instructlabel?.numberOfLines = 0
            instructlabel?.textAlignment = .center
            instructlabel?.adjustsFontSizeToFitWidth = true
            instructlabel?.sizeToFit()
            self.view.addSubview(instructlabel!)
            
            //Constraints for label
            instructlabel?.translatesAutoresizingMaskIntoConstraints = false
            
            instructlabel?.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: logoImg!.bottomAnchor, multiplier: 0.0).isActive = true
           instructlabel?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true
            instructlabel?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
            instructlabel?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
            
            
            
            //Attributes
            usertxt = UITextField ()
            
            usertxt?.placeholder="Username"
            usertxt?.borderStyle = UITextField.BorderStyle.line
            usertxt?.backgroundColor = UIColor.white
            usertxt?.textColor = UIColor.blue
            
            self.view.addSubview(usertxt!)
        
           //Constraints for label
            usertxt?.translatesAutoresizingMaskIntoConstraints = false
            //y
            usertxt?.topAnchor.constraint(equalToSystemSpacingBelow: instructlabel!.bottomAnchor, multiplier: 0.5).isActive = true
           usertxt?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true
            usertxt?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
            usertxt?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
            
            
            
            
            //UITextField
            passwordtxt = UITextField ()
                      
            passwordtxt?.placeholder="password"
            passwordtxt?.borderStyle = UITextField.BorderStyle.line
            passwordtxt?.backgroundColor = UIColor.white
            passwordtxt?.textColor = UIColor.blue
            
            self.view.addSubview(passwordtxt!)
        
           //Constraints for label
            passwordtxt?.translatesAutoresizingMaskIntoConstraints = false
            //y
            passwordtxt?.topAnchor.constraint(equalToSystemSpacingBelow: usertxt!.bottomAnchor, multiplier: 0.5).isActive = true
            passwordtxt?.centerXAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true
            passwordtxt?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
            passwordtxt?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
            
            
            
            
            confirmpasswordtxt = UITextField ()
           // usertxt?.sizeToFit()
            
            confirmpasswordtxt?.placeholder="Confirm password"
            confirmpasswordtxt?.borderStyle = UITextField.BorderStyle.line
            confirmpasswordtxt?.backgroundColor = UIColor.white
            confirmpasswordtxt?.textColor = UIColor.blue
            
            self.view.addSubview(confirmpasswordtxt!)
        
           //Constraints for label
            confirmpasswordtxt?.translatesAutoresizingMaskIntoConstraints = false
            //y
            confirmpasswordtxt?.topAnchor.constraint(equalToSystemSpacingBelow: passwordtxt!.bottomAnchor, multiplier: 0.5).isActive = true
            confirmpasswordtxt?.centerXAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true
            confirmpasswordtxt?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
            confirmpasswordtxt?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
            
            
                      
            verifybtn = UIButton()
            verifybtn?.setBackgroundImage(UIImage(named: "pinkrectangle"), for: .normal)
            verifybtn?.setTitle("Sign Up", for: .normal)
            verifybtn?.setTitleColor(.red, for:.normal)
            self.view.bringSubviewToFront(verifybtn!)
            
            verifybtn?.imageView?.contentMode = .scaleAspectFit
            self.view.addSubview(verifybtn!)
            
            //adding a target for our button gesture
            verifybtn?.addTarget(self, action: #selector(gestureFunc), for: .touchUpInside)
            
            verifybtn?.translatesAutoresizingMaskIntoConstraints = false
            
            verifybtn?.topAnchor.constraint(equalToSystemSpacingBelow: confirmpasswordtxt!.bottomAnchor, multiplier:1.0).isActive = true
            
            verifybtn?.centerXAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true
            
            verifybtn?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
            verifybtn?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
            
            animateLogo()
            
            verifyfade()
            labelAnimation()
            passwordAnimation()
        }
////////////////////////////////////////////////////////ANIMATION///////////////////////////////////////////////////
    func animateLogo() {
     
      
      UIView.animate(withDuration: 1.0,
                     delay: 0.5,
                     animations: {
          self.logoImg!.transform = CGAffineTransform(scaleX: 0.2, y:0.5)
          self.logoImg!.transform = CGAffineTransform(rotationAngle: .pi)
          self.logoImg!.transform = CGAffineTransform.identity
      },
                     completion: { finished in
                      print("Logo Animation!")
                            
      })
       
    }
    
   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///
    func verifyfade() {
     
      
      UIView.animate(withDuration: 6.0,
                     delay: 1.0,
                     animations: {
          self.verifybtn!.transform = CGAffineTransform(scaleX: 0.2, y:0.5)
          self.verifybtn!.transform = CGAffineTransform.identity
},          completion: { finished in
                      print("verify Animation!")
                    
      })
        
       
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func labelAnimation() {
        UIView.animate(withDuration: 3.0,
                       delay: 7.5,
                       animations: {
            self.instructlabel!.layer.backgroundColor = UIColor.systemPink.cgColor
            self.instructlabel!.layer.opacity=0.5
            self.instructlabel!.layer.opacity=1.0
     })
        print("Label Animation!")
       
      
       
    }
                       
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func passwordAnimation() {
     
        UIView.animate(withDuration: 5.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .allowAnimatedContent,
                       animations: {self.passwordtxt!.center.x=self.view.frame.width/2}, completion:nil)
       
        UIView.animate(withDuration: 5.0,
                       delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0,
                           options: .allowAnimatedContent,
                        animations: {self.confirmpasswordtxt!.center.x=self.view.frame.width/2}, completion:nil)
       
    
        UIView.animate(withDuration: 4.0,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .allowAnimatedContent,
                       animations: {self.usertxt!.center.y=self.view.frame.height/2}, completion:nil)
    }
   
    
    
       @objc func gestureFunc() {
            //MARK: - Button will push us back last VC
            navigationController?.pushViewController(SignUPViewController(), animated: true)
        }
    }

