//
//  customViewController.swift
//  videoPlayingApp
//
//  Created by Deepanshu Kandpal  on 19/07/18.
//  Copyright © 2018 Deepanshu Kandpal . All rights reserved.
//

import UIKit
import GPUImage2

class ViewController: UIViewController {
    "https://s3.ap-south-1.amazonaws.com/jep-content/HelloJio/videos/rb/mp4/BTYQ1-Q9.mp4"
    @IBOutlet weak var renderView: UIView!
    var newRenderView = RenderView()
    var movie:MovieInput!
    var filter:MonochromeFilter!
    var newFilter:ChromaKeyBlend!
    var sourceImage:PictureInput!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:"https://jep-asset.akamaized.net/HelloJio/configs/rb/rb_bg.jpg")
        let bundleURL = Bundle.main.resourceURL!
        let movieURL = URL(string:"sample.mp4", relativeTo:bundleURL)!

        do {
            movie = try MovieInput(url:movieURL, playAtActualSpeed:true)
            newFilter = ChromaKeyBlend()
            movie --> newFilter --> newRenderView
            if let data = try? Data(contentsOf: url!)
            {
                let backgroundImage: UIImage = UIImage(data: data)!
                sourceImage = PictureInput(image: backgroundImage)
                sourceImage.addTarget(newFilter)
                sourceImage.processImage()
            }
            movie.runBenchmark = true
            movie.start()
            renderView.addSubview(newRenderView)
            newRenderView.frame = view.bounds
        } catch {
            print("Couldn't process movie with error: \(error)")
        }
    }
}



