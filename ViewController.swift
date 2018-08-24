//
//  ViewController.swift
//  videoWithSpeechEngine
//
//  Created by Deepanshu Kandpal  on 23/08/18.
//  Copyright © 2018 Deepanshu Kandpal . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var videoBotView:MJioHelloJioVideoBot?
    
        override func viewDidLoad() {
        super.viewDidLoad()
            self.videoBotView = Bundle.main.loadNibNamed("videoBotView", owner: self, options: nil)?.first as? MJioHelloJioVideoBot
        view.addSubview(videoBotView!)
        videoBotView?.frame = view.bounds
      let url = "https://s3.ap-south-1.amazonaws.com/jep-content/HelloJio/videos/rb/mp4/BTYQ1-Q9.mp4"
        self.videoBotView?.configure(url:url)
        self.videoBotView?.play()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



