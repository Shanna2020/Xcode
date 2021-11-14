//
//  AddImageViewController.swift
//  Assignment3
//
//  Created by user199511 on 11/8/21.
//

import UIKit

//custom made protocol to handle to the adding of Image back to the first view controller
protocol AddingImageDelegateProtocol {
    func controllerDidCompleteAddImageDelegate(img: ImageInfo)//function to add image
    func controllerDidCancelAddImageDelegate()//function to cancel image
}


// View controller class to add Image
class AddImageViewController: UIViewController {
    
    public var ImgDelegate: AddingImageDelegateProtocol?//variable associated with the protocol to allow sending data back to the first viewcontroller
    
    @IBOutlet weak var ImgNameTxt: UITextField!
    
    @IBOutlet weak var ImgUrlTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Action associated when click the add button
    @IBAction func AddBtnAction(_ sender: Any) {
       
        if let name = ImgNameTxt.text{
            if let ImgURL = ImgUrlTxt.text{
                
                if !name.isEmpty && !ImgURL.isEmpty{
                    guard let IURL = URL(string:ImgURL) else { return  }
                    let newImg = ImageInfo(n:name,url: IURL )
                    ImgDelegate?.controllerDidCompleteAddImageDelegate(img: newImg)
                    
                    dismiss(animated: true, completion:nil)
                }
            }
        }
    }
    
   //Action associated with cancel button
    @IBAction func CancelBtnAction(_ sender: Any) {
        dismiss(animated: true, completion:nil)
      
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
