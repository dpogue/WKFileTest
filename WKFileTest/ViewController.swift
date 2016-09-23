//
//  ViewController.swift
//  WKFileTest
//
//  Created by Darryl Pogue on 2016-09-23.
//  Copyright © 2016 Darryl Pogue. All rights reserved.
//

import UIKit
import WebKit

let USE_WKWEBVIEW = true

class ViewController: UIViewController {
    
    var oldView: UIWebView?
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        
        self.oldView = UIWebView()
        self.webView = WKWebView()
        
        if (USE_WKWEBVIEW) {
            self.view = self.webView!
        } else {
            self.view = self.oldView!
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let bundle = Bundle.main;
        let wwwPath = bundle.path(forResource:"index.html", ofType:"", inDirectory:"www");
        let url = URL.init(fileURLWithPath: wwwPath!);
        let dir = url.deletingLastPathComponent();
        
        let request = URLRequest.init(url: url);
        
        self.oldView?.loadRequest(request);
        
        _ = self.webView?.loadFileURL(url, allowingReadAccessTo:dir);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

