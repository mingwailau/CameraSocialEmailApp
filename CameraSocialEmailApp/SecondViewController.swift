//
//  SecondViewController.swift
//  CameraSocialEmailApp
//
//  Created by Ming Wai on 30/9/15.
//  Copyright (c) 2015 com.Ming Wai. All rights reserved.
//

import UIKit
import Social

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    @IBOutlet weak var MainTextField: UITextField!
    
    
    
    @IBOutlet weak var MainImageView: UIImageView!
    
    
    
    @IBAction func choseImageFromPhotoLibrary() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func ChooseFromCamera(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        MainImageView.image = info[UIImagePickerControllerOriginalImage] as! UIImage
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func ShareToFacebook(sender: UIButton) {
   
        var shareToFacebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        shareToFacebook.setInitialText(MainTextField.text)
        shareToFacebook.addImage(MainImageView.image)
        
        self.presentViewController(shareToFacebook, animated:true, completion:nil)
        
    }
    
    
    
    
    

}

