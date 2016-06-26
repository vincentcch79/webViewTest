//
//  ViewController.swift
//  WebViewTest
//
//  Created by 張智涵 on 2016/6/24.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import WebKit
import SafariServices



class ViewController: UIViewController {

    @IBOutlet weak var ProgressView: UIProgressView!
    var webView: WKWebView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //WebView
        webView = WKWebView(frame: UIScreen.mainScreen().bounds)
        webView.navigationDelegate = self
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
        
        
        
//        self.view.addSubview(webView)
        
        self.view.insertSubview(webView, belowSubview: ProgressView)
        
        
        
        let url = NSURL(string: "https://www.apple.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "estimatedProgress" {
            self.ProgressView.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }

    @IBAction func goWeb(sender: AnyObject) {
        
//        let url = NSURL(string: "https://www.apple.com")
//        UIApplication.sharedApplication().openURL(url!)
        
//        let url = NSURL(string: "https://www.apple.com")
//        let controller = SFSafariViewController(URL: url!)
//        self.presentViewController(controller, animated: true, completion: nil)
        
    }

}




extension ViewController: WKNavigationDelegate {
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        self.ProgressView.hidden = true
        self.ProgressView.setProgress(0.0, animated: true)
    }

}

