//
//  WebTemplateViewController.swift
//  Saarc App
//
//  Created by Fahim Rahman on 30/11/19.
//  Copyright © 2019 Fahim Rahman. All rights reserved.
//

import UIKit
import WebKit

class WebTemplateViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var stringValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebviewFromServer()
    }
    
    func loadWebviewFromServer() {
        
        if stringValue == "bangladesh" {
            let url = URL(string: "https://bn.wikipedia.org/wiki/%E0%A6%AC%E0%A6%BE%E0%A6%82%E0%A6%B2%E0%A6%BE%E0%A6%A6%E0%A7%87%E0%A6%B6")
            let request = URLRequest(url: url!)
            webView.load(request)
        }
        if stringValue == "india" {
            let url = URL(string: "https://bn.wikipedia.org/wiki/%E0%A6%AD%E0%A6%BE%E0%A6%B0%E0%A6%A4")
            let request = URLRequest(url: url!)
            webView.load(request)
        }
        if stringValue == "pakistan" {
            let url = URL(string: "https://bn.wikipedia.org/wiki/%E0%A6%AA%E0%A6%BE%E0%A6%95%E0%A6%BF%E0%A6%B8%E0%A7%8D%E0%A6%A4%E0%A6%BE%E0%A6%A8")
            let request = URLRequest(url: url!)
            webView.load(request)
        }
        if stringValue == "srilanka" {
            let url = URL(string: "https://bn.wikipedia.org/wiki/%E0%A6%B6%E0%A7%8D%E0%A6%B0%E0%A7%80%E0%A6%B2%E0%A6%99%E0%A7%8D%E0%A6%95%E0%A6%BE")
            let request = URLRequest(url: url!)
            webView.load(request)
        }
        if stringValue == "nepal" {
            let url = URL(string: "https://bn.wikipedia.org/wiki/%E0%A6%A8%E0%A7%87%E0%A6%AA%E0%A6%BE%E0%A6%B2")
            let request = URLRequest(url: url!)
            webView.load(request)
        }
        if stringValue == "maldive" {
            let url = URL(string: "https://bn.wikipedia.org/wiki/%E0%A6%AE%E0%A6%BE%E0%A6%B2%E0%A6%A6%E0%A7%8D%E0%A6%AC%E0%A7%80%E0%A6%AA")
            let request = URLRequest(url: url!)
            webView.load(request)
        }
        if stringValue == "bhutan" {
            let url = URL(string: "https://bn.wikipedia.org/wiki/%E0%A6%AD%E0%A7%82%E0%A6%9F%E0%A6%BE%E0%A6%A8")
            let request = URLRequest(url: url!)
            webView.load(request)
        }
        if stringValue == "afganistan" {
            let url = URL(string: "https://bn.wikipedia.org/wiki/%E0%A6%86%E0%A6%AB%E0%A6%97%E0%A6%BE%E0%A6%A8%E0%A6%BF%E0%A6%B8%E0%A7%8D%E0%A6%A4%E0%A6%BE%E0%A6%A8")
            let request = URLRequest(url: url!)
            webView.load(request)
        }
    }
}
