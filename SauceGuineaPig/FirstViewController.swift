//
//  FirstViewController.swift
//  SauceGuineaPig
//
//  Created by Mehmet Gerceker on 1/8/16.
//  Copyright © 2016 Awesome Company. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var uncheckedCheckBox: UISwitch!
    @IBOutlet weak var checkedCheckBox: UISwitch!
    @IBOutlet weak var yourComments: UILabel!
    @IBOutlet weak var fbEmail: UITextField!
    @IBOutlet weak var comments: UITextView!
    @IBOutlet weak var clientTime: UILabel!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var iAmALink: UILabel!
    @IBOutlet weak var userAgent: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        self.getTime()
        let utgr = UITapGestureRecognizer.init(target: self, action: Selector("handleLinkTap:"))
        iAmALink.addGestureRecognizer(utgr)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        clientTime.text = getTime()
        let device = UIDevice()
        userAgent.text = device.systemName + " " + device.systemVersion + " " + device.model
        userAgent.text = userAgent.text! + " " + device.identifierForVendor!.UUIDString
    }
    
    func handleLinkTap(gestureRecogizer: UIGestureRecognizer){
        let url = NSURL(string: "https://saucelabs.com/test-guinea-pig2.html")
        let app = UIApplication.sharedApplication()
        if(app.canOpenURL(url!)){
            app.openURL(url!)
        } else {
            //ignore ;)
        }
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func getTime() ->String{
        return "\(NSDate().timeIntervalSince1970 * 1000)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func handleSend(sender: AnyObject) {
        yourComments.text = comments.text
        comments.text = nil
        checkedCheckBox.setOn(true, animated: true)
        uncheckedCheckBox.setOn(false, animated: true)
        fbEmail.text = nil
        clientTime.text = getTime()
    }


}

