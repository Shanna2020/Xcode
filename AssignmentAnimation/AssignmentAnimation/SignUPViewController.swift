//
//  SignUPViewController.swift
//  AssignmentAnimation
//
//  Created by user214013 on 2/21/22.
//


import UIKit

class SignUPViewController: UIViewController {

var logoImg: UIImageView?

var mobileButtonImg: UIImageView?
var instructlabel: UILabel?

var verifybtn:UIButton?

var passwordtxt: UITextField?

var usertxt: UITextField?



override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
 
    self.view.backgroundColor = .white
    
    
    logoImg = UIImageView(image: UIImage(named: "group1"))
   
    view.addSubview(logoImg!)

    logoImg?.translatesAutoresizingMaskIntoConstraints = false
    logoImg?.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0.5).isActive = true
    
    logoImg?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 1.0).isActive = true
    logoImg?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
    logoImg?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50).isActive = true
    
    
    instructlabel = UILabel()
    instructlabel?.text = "Enter User Name and Password, then Click Login In"
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
    
    //
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
    
    
    verifybtn = UIButton()
    
    verifybtn?.setBackgroundImage(UIImage(named: "pinkrectangle"), for: .normal)
    verifybtn?.setTitle("Log In", for: .normal)
    verifybtn?.setTitleColor(.red, for:.normal)

    self.view.bringSubviewToFront(verifybtn!)
    verifybtn!.alpha=0.0;
    verifybtn?.imageView?.contentMode = .scaleAspectFit
    self.view.addSubview(verifybtn!)
    
    //adding a target for our button gesture
    verifybtn?.addTarget(self, action: #selector(gestureFunc), for: .touchUpInside)
    
    verifybtn?.translatesAutoresizingMaskIntoConstraints = false
    
    verifybtn?.topAnchor.constraint(equalToSystemSpacingBelow: passwordtxt!.bottomAnchor, multiplier:5.0).isActive = true
    
    verifybtn?.centerXAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true
    
    verifybtn?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    verifybtn?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
    
    animateLogo()
    labelAnimation()
    passwordAnimation()
    verifyfade()
    
}
///////////////////////////////////////ANIMATION////////////////////////////////////////////////////////////////////
func animateLogo() {

let animation = CABasicAnimation(keyPath: "position")
       animation.duration = 1
       animation.repeatCount = 2
       animation.autoreverses = true
       animation.fromValue = NSValue(cgPoint: CGPoint(x:  logoImg!.center.x - 150, y:  logoImg!.center.y))
       animation.toValue = NSValue(cgPoint: CGPoint(x:  logoImg!.center.x + 150, y:  logoImg!.center.y))
        logoImg!.layer.add(animation, forKey: "position")
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func labelAnimation() {
    UIView.animate(withDuration: 3.0,
                   delay: 3.0,
                   options: [.transitionCrossDissolve, .repeat],
    animations: {
        self.instructlabel!.layer.opacity=1.0
        self.instructlabel!.textColor=UIColor.systemPink
        self.instructlabel!.layer.opacity=0.5
        
     })
    print("Label Animation!")
   
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
func verifyfade() {


    UIView.animate(withDuration: 6.0,
                   delay: 8,
                   options: [.curveEaseInOut],
                   animations: {
        self.verifybtn!.alpha = 1.0
    },
                   completion: { finished in
                    print("Button Animation!")
})
}


func passwordAnimation() {
    

   UIView.animate(withDuration: 4.0,
                   delay: 1.5,
                  options:[.autoreverse],
                   animations: {
       self.usertxt!.alpha = 0.5
       self.usertxt!.transform = CGAffineTransform(rotationAngle: .pi)
       self.usertxt!.transform = CGAffineTransform.identity
       self.usertxt!.backgroundColor = UIColor.systemGreen
       self.usertxt!.alpha = 1
      
 })
    
    UIView.animate(withDuration: 4.0,
                    delay: 1.5,
                    animations: {
        self.passwordtxt!.alpha = 0.5
        self.passwordtxt!.transform = CGAffineTransform(rotationAngle: .pi)
        self.passwordtxt!.transform = CGAffineTransform.identity
        self.passwordtxt!.backgroundColor = UIColor.systemYellow
        self.passwordtxt!.alpha = 1
       
  })

    print("Password Animation!")
   
}




   @objc func gestureFunc() {
    //MARK: - Button will push us back last VC
    navigationController?.pushViewController(ViewController(), animated: true)
}
}

