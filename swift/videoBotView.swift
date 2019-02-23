//
//  videoBotView.swift
//  helloJioSDK
//
//  Created by Deepanshu Kandpal  on 14/08/18.
//  Copyright © 2018 Deepanshu Kandpal . All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import GPUImage

@objc protocol MJioHelloJioVideoBotProtocol
{
    func closeVideoBotView()
    func tapOnVideoBotView()
}


class MJioHelloJioVideoBot: GPUImageView {
    
    @IBOutlet weak var videoBotBackgroungImg: UIImageView!
    var playerLayer: AVPlayerLayer?
    var movie: GPUImageMovie!
    var filter: GPUImageChromaKeyBlendFilter!
    var sourcePicture: GPUImagePicture!
    var firstImage: GPUImagePicture!
    var player = AVPlayer()
    @objc public var isLoop: Bool = false
    @objc weak var  videoBotDelegate : MJioHelloJioVideoBotProtocol?
    @objc var selectedLanuageVideoCollectionDict : NSDictionary = [:]
     var isExit: Bool = false
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var videoCameraView: UIView!
    
    @IBOutlet weak var rotateCameraButton: UIButton!
   
    @IBOutlet weak var closeCameraButton: UIButton!
    
    var videoCount : Int = 0
    var shortVideoCount : Int = 0
   
    @IBOutlet weak var videoBotQueryLabel: UILabel!
    
   
    var captureSession:AVCaptureSession?
    var cameraPreviewLayer:AVCaptureVideoPreviewLayer?
    var isCameraViewOpen : Bool = true
    var  captureDevice : AVCaptureDevice?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let gestureView = UITapGestureRecognizer(target: self, action:  #selector (self.tapOnAction (_:)))
        self.addGestureRecognizer(gestureView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    @objc func tapOnAction(_ sender:UITapGestureRecognizer){
        
        if (self.videoBotDelegate != nil)
        {
            self.videoBotDelegate?.tapOnVideoBotView()
        }
    }
    @objc func configure(url: String) {
        
        self.removeObjects()
        // self.getThumbnailFrom(path:url)
        
        if let videoURL = URL(string: url)
        {
            //                self.player = AVPlayer(url: videoURL)
            //                self.playerLayer = AVPlayerLayer(player: self.player)
            //                self.playerLayer?.frame = self.bounds
            //                self.playerLayer?.videoGravity = AVLayerVideoGravity.resize
            //                if let playerLayer = self.playerLayer {
            //                    self.layer.addSublayer(playerLayer)
            //                }
            
            let playerItem = AVPlayerItem(url: videoURL)
            
            self.player.replaceCurrentItem(with: playerItem)
            filter = GPUImageChromaKeyBlendFilter()
            filter.forceProcessing(at: CGSize(width: self.frame.width , height: self.frame.height))
            filter.thresholdSensitivity = 0.3
            filter.smoothing = 0.1
            filter.setColorToReplaceRed(0, green: 1, blue: 0)
            movie = GPUImageMovie(playerItem: playerItem)
            movie.playAtActualSpeed = true
            movie.addTarget(filter)
            movie.startProcessing()
            let url = URL(string:"https://jep-asset.akamaized.net/HelloJio/configs/rb/rb_bg.jpg")
            if let data = try? Data(contentsOf: url!)
            {
                let backgroundImage: UIImage = UIImage(data: data)!
                sourcePicture = GPUImagePicture(image: backgroundImage)
                sourcePicture.addTarget(filter)
                sourcePicture.processImage()
                filter.addTarget(self)
            }
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.reachTheEndOfTheVideo(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
        }
        self.bringSubview(toFront:self.videoCameraView!)
        self.bringSubview(toFront:self.closeButton!)
        self.bringSubview(toFront:self.videoBotQueryLabel!)
        self.bringSubview(toFront:self.closeCameraButton!)
        
    }
    
    @objc func getThumbnailFrom(path: String)  {
        
        do {
            self.videoBotBackgroungImg.image = nil
            if let videoURL = URL(string: path)
            {
                let asset = AVURLAsset(url: videoURL , options: nil)
                let imgGenerator = AVAssetImageGenerator(asset: asset)
                imgGenerator.appliesPreferredTrackTransform = true
                let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
                let thumbnail = UIImage(cgImage: cgImage)
                self.videoBotBackgroungImg?.image = thumbnail
            }
        } catch let error {
            
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            
        }
    }
    
    @IBAction func rotateCameraAction(_ sender: Any) {if self.captureDevice?.position == .back {
        self.cameraPreview(orientation: .front)
    }
    else {
        self.cameraPreview(orientation: .back)
        }
    }
    
    @IBAction func closeCameraViewAction(_ sender: Any) {
        if self.isCameraViewOpen {
        self.videoCameraView.isHidden = true
        self.isCameraViewOpen = false
    }
    else {
        self.videoCameraView.isHidden = false
        self.isCameraViewOpen = true
        }
    }
   
    @IBAction func closeVideoBotAction(_ sender: Any) {
        self.isExit = true
        self.closeButton.isUserInteractionEnabled = false
        var idleVideoString : String?
        let baseUrl : String = self.selectedLanuageVideoCollectionDict["base"] as! String
        var idleVideoArray : Array<Any> = self.selectedLanuageVideoCollectionDict["exit_videos"] as! Array
        idleVideoString = idleVideoArray[0] as? String
        self.videoBotQueryLabel.text = nil
        self.configure(url: baseUrl + idleVideoString!)
        self.play()
    }
    
    
    
    @objc func play() {
        if #available(iOS 10.0, *) {
            if self.player.timeControlStatus != AVPlayerTimeControlStatus.playing {
                self.player.play()
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    func pause() {
        self.player.pause()
    }
    
    @objc func stop() {
        // DispatchQueue.main.async{
        self.player.pause()
        self.player.seek(to: kCMTimeZero)
        
    }
    func removeObjects(){
        // self.playerLayer?.removeFromSuperlayer()
        self.player.cancelPendingPrerolls()
        
        NotificationCenter.default.removeObserver(self,name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                  object: self.player.currentItem)
    }
    
    
    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
        if isLoop {
            self.player.pause()
            self.player.seek(to: kCMTimeZero)
            self.player.play()
        }
        else
        {
            var idleVideoString : String?
            let baseUrl : String = self.selectedLanuageVideoCollectionDict["base"] as! String
            var idleVideoArray : Array<Any> = self.selectedLanuageVideoCollectionDict["idle_videos"] as! Array
            
            if (idleVideoArray.count > self.videoCount){
                idleVideoString = idleVideoArray[self.videoCount] as? String
                self.videoCount += 1;
                
            }
            else{
                idleVideoArray = self.selectedLanuageVideoCollectionDict["shortguide_videos"] as! Array
                if (idleVideoArray.count > self.shortVideoCount){
                    idleVideoString = idleVideoArray[self.shortVideoCount] as? String
                    self.shortVideoCount += 1
                }
                else{
                    self.shortVideoCount = 0
                    idleVideoString = idleVideoArray[self.shortVideoCount] as? String
                }
                self.videoCount = 0
            }
            self.videoBotQueryLabel.text = nil
            self.configure(url: baseUrl + idleVideoString!)
            self.play()
            
        }
    }
    
    @objc func cameraPreview(orientation:AVCaptureDevice.Position)
    {
        if #available(iOS 10.0, *)
        {
            self.captureDevice = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera, for: AVMediaType.video, position:orientation)
            guard let captureDeviceInfo = self.captureDevice else{
                self.videoCameraView.isHidden = true
                return
            }
            do {
                let input = try AVCaptureDeviceInput(device: captureDeviceInfo)
                self.captureSession = AVCaptureSession()
                self.captureSession?.addInput(input)
                self.cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                self.cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
                self.cameraPreviewLayer?.frame = videoCameraView.bounds
                self.videoCameraView.layer.addSublayer(cameraPreviewLayer!)
                captureSession?.startRunning()
                self.videoCameraView.bringSubview(toFront:self.rotateCameraButton!)
                self.videoCameraView.isHidden = false
                
            } catch {
                print(error.localizedDescription)
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
}
