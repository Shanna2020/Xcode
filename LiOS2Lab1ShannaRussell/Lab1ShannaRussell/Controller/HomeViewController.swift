//
//  HomeViewController.swift
//  Lab1ShannaRussell
//
//  Created by user214013 on 1/28/22.
//

import UIKit

class HomeViewController: UIViewController {

        // Do any additional setup after loading the view.
    //UI Elements
          var letterbtn: UIButton?
          var bgImg: UIImageView?
          var loginlabel: UILabel?
          var descriplabel: UILabel?
          var butterflyImg: UIImageView?
          var welcomeImg: UIImageView?

          override func viewDidLoad() {
              super.viewDidLoad()

              // Do any additional setup after loading the view.
              self.view.backgroundColor = .white
              
              //MARK: - Background Image
              bgImg = UIImageView(image: UIImage(named: "photo"))
              view.addSubview(bgImg!)
              bgImg?.alpha = 1.0
              
              //setting auto resizing to false
              bgImg?.translatesAutoresizingMaskIntoConstraints = false
              //y
              bgImg?.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0.0).isActive = true
              //x
              bgImg?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 1.0).isActive = true
              //width
              bgImg?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
              //height
              bgImg?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0).isActive = true
          
            
              butterflyImg = UIImageView(image: UIImage(named: "butterfly"))
              self.view.addSubview(butterflyImg!)
              butterflyImg?.translatesAutoresizingMaskIntoConstraints = false
              butterflyImg?.topAnchor.constraint(equalToSystemSpacingBelow: bgImg!.topAnchor, multiplier: 14.0).isActive = true
              butterflyImg?.leadingAnchor.constraint(equalToSystemSpacingAfter: bgImg!.leadingAnchor, multiplier: 12).isActive = true
              butterflyImg?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
              butterflyImg?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
              
            
              //Welcome
              welcomeImg = UIImageView(image: UIImage(named: "welcome"))
              self.view.addSubview(welcomeImg!)
              
              welcomeImg?.translatesAutoresizingMaskIntoConstraints = false
              welcomeImg?.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 15.0).isActive = true
              welcomeImg?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 1.0).isActive = true
              welcomeImg?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
              welcomeImg?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
              
              descriplabel = UILabel()
              descriplabel?.text = "Taking time for your mental help is important. Take time out to relax and search the web. Being upto date with the everyday happenings are equally important. So login and check you email. Also view the fun icons provided. We provide a secure channel for you"
              descriplabel?.font = UIFont(name: "Verdana", size: 18)
              descriplabel?.textColor = .black
              descriplabel?.numberOfLines = 10
              descriplabel?.textAlignment = .justified
              descriplabel?.adjustsFontSizeToFitWidth = true
              descriplabel?.sizeToFit()
              self.view.addSubview(descriplabel!)
              
              //Constraints for label
              descriplabel?.translatesAutoresizingMaskIntoConstraints = false
              
              descriplabel?.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: welcomeImg!.topAnchor, multiplier: 10.0).isActive = true
              descriplabel?.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4.0).isActive = true
              descriplabel?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
              descriplabel?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
              
              
              
              
              
              letterbtn = UIButton()
              letterbtn?.setBackgroundImage(UIImage(named: "letter"), for: .normal)
              letterbtn?.setTitle("Email Image", for: .highlighted)
              self.view.bringSubviewToFront(letterbtn!)
              
              letterbtn?.imageView?.contentMode = .scaleAspectFit
              self.view.addSubview(letterbtn!)
              
              //adding a target for our button gesture
              letterbtn?.addTarget(self, action: #selector(backToPrev), for: .touchUpInside)
              
              letterbtn?.translatesAutoresizingMaskIntoConstraints = false
              
              //x
              letterbtn?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true
              //y
              letterbtn?.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: descriplabel!.bottomAnchor, multiplier: 1.0).isActive = true
              
              //height
              letterbtn?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
              
              //width
              letterbtn?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
                          
              
              
              
              //MARK: - Label
              //Attributes
              loginlabel = UILabel()
              loginlabel?.text = "Click to Login"
              loginlabel?.font = UIFont(name: "Verdana", size: 25)
              loginlabel?.textColor = .black
              loginlabel?.numberOfLines = 0
              loginlabel?.textAlignment = .center
              loginlabel?.adjustsFontSizeToFitWidth = true
              loginlabel?.sizeToFit()
              self.view.addSubview(loginlabel!)
              
              //Constraints for label
              loginlabel?.translatesAutoresizingMaskIntoConstraints = false
              
              loginlabel?.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: letterbtn!.topAnchor, multiplier: 3.0).isActive = true
              loginlabel?.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true
              loginlabel?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
              loginlabel?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
              
          }
          
          @objc func backToPrev() {
              //MARK: - Button will push us back last VC
              navigationController?.pushViewController(LoginViewController(), animated: true)
          }
          }
      
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


