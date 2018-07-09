//
//  detailViewController.swift
//  UI ELEMENTS
//
//  Created by mac on 6/25/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import WebKit

class detailViewController: UIViewController{
    
    var webView: WKWebView!
    var detailNewsItem : [String:String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard detailNewsItem != nil else {return}
        let url = detailNewsItem["url"]
        print(url!)
        guard url != nil else {return}
        let newurl = URL(string: url!)!
        print(newurl)
        
        webView.load(URLRequest(url: newurl))
    }
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


