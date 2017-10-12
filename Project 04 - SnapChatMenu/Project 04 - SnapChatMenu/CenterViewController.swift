//
//  CenterViewController.swift
//  Project 04 - SnapChatMenu
//
//  Created by sfzx on 2017/10/12.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit
import AVFoundation


class CenterViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.session.startRunning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.session.stopRunning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCamera()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupCamera()  {
        if self.session.canAddInput(self.videoInput) {
            self.session.addInput(self.videoInput)
        }
        
        if self.session.canAddOutput(self.imageOutput) {
            self.session.addOutput(self.imageOutput)
        }
        self.view.layer.addSublayer(self.previewLayer)
        self.view.addSubview(self.takePhotoBtn)
    }
    
    
    @objc func takePhotoBtnClick() {
        let stillImageConnection = self.imageOutput.connection(with: .video)
        
        self.imageOutput.captureStillImageAsynchronously(from: stillImageConnection!) { (imageDataSampleBuffer, error) in
            
            let jpeaData = AVCaptureStillImageOutput .jpegStillImageNSDataRepresentation(imageDataSampleBuffer!)
            let image = UIImage.init(data: jpeaData!)
            print(image)
            
        }
    }
    
    lazy var session: AVCaptureSession = {
        let session = AVCaptureSession.init()
        return session
    }()
    
    
    lazy var videoInput: AVCaptureDeviceInput = {
        let device = AVCaptureDevice.default(for: .video)
        let  videoInput = try! AVCaptureDeviceInput.init(device: device!)
        return videoInput
    }()
    
    lazy var imageOutput: AVCaptureStillImageOutput = {
        let imageOutput = AVCaptureStillImageOutput()
        let outSettings = [AVVideoCodecKey:AVVideoCodecJPEG]
        imageOutput.outputSettings = outSettings
        return imageOutput
    }()
    
    
    lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let previewLayer = AVCaptureVideoPreviewLayer.init(session: self.session)
        previewLayer.frame = CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight)
        return previewLayer
    }()
    
    
    lazy var takePhotoBtn: UIButton = {
        let takePhotoBtn = UIButton()
        takePhotoBtn.setImage(UIImage.init(named: "takePhoto"), for: .normal)
        takePhotoBtn.frame = CGRect.init(x: (screenWidth-100)*0.5, y: screenHeight - 110, width: 100, height: 100)
        takePhotoBtn.imageView?.contentMode = .scaleAspectFill
        takePhotoBtn.addTarget(self, action: #selector(takePhotoBtnClick), for: .touchUpInside)
        return takePhotoBtn
    }()
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

