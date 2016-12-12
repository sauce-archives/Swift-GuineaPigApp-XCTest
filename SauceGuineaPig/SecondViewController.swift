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
    
    var url:URL = URL(string:"https://saucelabs.com/test/guinea-pig")!
    
    override func viewDidLoad() {
        webView.delegate = self;
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backButton.isHidden = true
        let request = URLRequest(url:url)
        webView.isUserInteractionEnabled = true
        webView.scalesPageToFit = true
        webView.scrollView.isScrollEnabled = true
        webView.scrollView.showsHorizontalScrollIndicator = true
        webView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(_ m_webView: UIWebView) {
        backButton.isHidden = !m_webView.canGoBack
        print(backButton.isHidden)
    }


}

