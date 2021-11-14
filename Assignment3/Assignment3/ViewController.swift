//
//  ViewController.swift
//  Assignment3
//
//  Created by user199511 on 11/8/21.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, AddingImageDelegateProtocol{
    
    var ImgManager: ImageManager = ImageManager()
    
    @IBOutlet weak var myImage: UIImageView!
    
    
    @IBOutlet weak var ImgViewPicker: UIPickerView!
    
    //pickerview returning number of componets////////////////
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    // pickerview returning the number of rows//////////////
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return  ImgManager.getAllImage().count
    }
    
    ///pickerview didSelectRow////////////////////
//
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         
        //Other Method //////////////////////////////////
        let queue = DispatchQueue.init(label: "1")
        queue.async {
            let data = try? Data(contentsOf: self.ImgManager.getAllImage()[row].ImageURL)
            
        //dispatchQueue  for main ////////////////////////
        DispatchQueue.main.async {
           
       
            self.myImage.image=UIImage(data: data!)
       }
    }
    }//end of method
   
    
    ///Title Row///////////////////////////////////////////////////////////////////////////
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return ImgManager.getAllImage()[row].name
        
        
    }
    
    
    ////////////////////////////Completed task of adding image///////////////////////////////////////////////////////////////////
    
    func controllerDidCompleteAddImageDelegate(img: ImageInfo) {
        ImgManager.addNewImage(newImg: img)
        ImgViewPicker.reloadAllComponents()
        
    }
    
    //Cancel Task of Adding Image///////////////////////////
    func controllerDidCancelAddImageDelegate() {
        dismiss(animated: true, completion: nil)

    }
    
    /////////////////prepare /segue////////////////////////////////////////////////////////////////
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        
        let addImgVC=segue.destination as! AddImageViewController
        addImgVC.ImgDelegate = self
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myImage.image=UIImage.init(named:"defaultPic")
        // Do any additional setup after loading the view.
    }


}

