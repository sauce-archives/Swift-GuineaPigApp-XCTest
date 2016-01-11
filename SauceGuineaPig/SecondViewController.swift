//
//  SecondViewController.swift
//  SauceGuineaPig
//
//  Created by Mehmet Gerceker on 1/8/16.
//  Copyright © 2016 Awesome Company. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var backButton: UIButton!
    
    var url:NSURL = NSURL(string:"https://saucelabs.com/test/guinea-pig")!
    
    override func viewDidLoad() {
        webView.delegate = self;
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backButton.hidden = true
        let request = NSURLRequest(URL:url)
        webView.userInteractionEnabled = true
        webView.scalesPageToFit = true
        webView.scrollView.scrollEnabled = true
        webView.scrollView.showsHorizontalScrollIndicator = true
        webView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(m_webView: UIWebView) {
        backButton.hidden = !m_webView.canGoBack
        print(backButton.hidden)
    }


}

