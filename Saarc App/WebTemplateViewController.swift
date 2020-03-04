//
//  WebTemplateViewController.swift
//  Saarc App
//
//  Created by Fahim Rahman on 30/11/19.
//  Copyright © 2019 Fahim Rahman. All rights reserved.
//

import UIKit
import WebKit

class WebTemplateViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    var stringValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        activityIndicator()
        indicator.startAnimating()
        indicator.color = .black
        loadWebviewFromServer()
        webView.scrollView.bounces = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
    }
    
    func loadWebviewFromServer() {
        
        let countries = ["bd","in","pk","sl","np","mv","bh","af"]
        
        let links = [
            "https://bn.wikipedia.org/wiki/%E0%A6%AC%E0%A6%BE%E0%A6%82%E0%A6%B2%E0%A6%BE%E0%A6%A6%E0%A7%87%E0%A6%B6",
            "https://bn.wikipedia.org/wiki/%E0%A6%AD%E0%A6%BE%E0%A6%B0%E0%A6%A4",
            "https://bn.wikipedia.org/wiki/%E0%A6%AA%E0%A6%BE%E0%A6%95%E0%A6%BF%E0%A6%B8%E0%A7%8D%E0%A6%A4%E0%A6%BE%E0%A6%A8",
            "https://bn.wikipedia.org/wiki/%E0%A6%B6%E0%A7%8D%E0%A6%B0%E0%A7%80%E0%A6%B2%E0%A6%99%E0%A7%8D%E0%A6%95%E0%A6%BE",
            "https://bn.wikipedia.org/wiki/%E0%A6%A8%E0%A7%87%E0%A6%AA%E0%A6%BE%E0%A6%B2",
            "https://bn.wikipedia.org/wiki/%E0%A6%AE%E0%A6%BE%E0%A6%B2%E0%A6%A6%E0%A7%8D%E0%A6%AC%E0%A7%80%E0%A6%AA",
            "https://bn.wikipedia.org/wiki/%E0%A6%AD%E0%A7%82%E0%A6%9F%E0%A6%BE%E0%A6%A8",
            "https://bn.wikipedia.org/wiki/%E0%A6%86%E0%A6%AB%E0%A6%97%E0%A6%BE%E0%A6%A8%E0%A6%BF%E0%A6%B8%E0%A7%8D%E0%A6%A4%E0%A6%BE%E0%A6%A8"
        ]
        
        for i in 0...7 {
            
            if stringValue == countries[i] {
                let url = URL(string: links[i])
                let request = URLRequest(url: url!)
                webView.load(request)
            }
        }
    }
    
    @IBAction func scrollToTop(_ sender: UIButton) {
        webView.scrollView.setContentOffset(CGPoint.zero, animated: true)
        
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    var indicator = UIActivityIndicatorView()

    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.medium
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
}
