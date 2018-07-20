//
//  ViewController.swift
//  videoPlayingApp
//
//  Created by Deepanshu Kandpal  on 19/07/18.
//  Copyright © 2018 Deepanshu Kandpal . All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController{
    let videoPlayerController = AVPlayerViewController()
    
    @IBOutlet weak var simpleButton: UIButton!
    @IBOutlet weak var videoView: UIView!
    override func viewDidLoad() {
    super.viewDidLoad()
    let videoURL = URL(string:"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
        videoPlayerController.showsPlaybackControls = false
        videoPlayerController.player = AVPlayer(url: videoURL!)
        videoView.addSubview(videoPlayerController.view)
        videoPlayerController.view.frame = videoView.bounds
        videoPlayerController.videoGravity = AVLayerVideoGravity.resizeAspectFill.rawValue;
        videoPlayerController.player?.play()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

