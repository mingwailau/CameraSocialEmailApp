//
//
//  FirstViewController.swift
//  CameraSocialEmailApp
//
//  Created by Ming Wai on 30/9/15.
//  Copyright (c) 2015 com.Ming Wai. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class FirstViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var EmailAddressField: UITextField!
    
    
    @IBOutlet weak var SubjectField: UITextField!
    
    
    @IBOutlet weak var MainTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    @IBAction func sendMail(sender: UIButton) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([EmailAddressField.text])
        mailComposerVC.setSubject(SubjectField.text)
        mailComposerVC.setMessageBody(MainTextField.text, isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}




