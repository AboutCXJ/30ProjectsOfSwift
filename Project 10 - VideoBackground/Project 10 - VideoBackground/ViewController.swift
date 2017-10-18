//
//  ViewController.swift
//  Project 10 - VideoBackground
//
//  Created by sfzx on 2017/10/18.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit
import AVKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height


class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.addobserver()
        self.player.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.removeObserver()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }


    func setupUI() {
        self.view.layer.addSublayer(self.playerLayer)
        self.view.addSubview(loginBtn)
        self.view.addSubview(signUPBtn)
        self.view.addSubview(logoView)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        get{
            return UIStatusBarStyle.lightContent
        }
    }
    
    
    //MARK: - handle
    
    
    func addobserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidPlayToEndTime), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc func playerItemDidPlayToEndTime() {
        self.player.seek(to: kCMTimeZero)
        self.player.play()
    }
    
    
//MARK: - 懒加载
    
    //播放器
    lazy var player: AVPlayer = {
        let path = Bundle.main.path(forResource: "moments", ofType: "mp4")
        let url = URL(fileURLWithPath: path!)
        let player = AVPlayer(url: url)
        return player
    }()
    
    //播放layer
    lazy var playerLayer: AVPlayerLayer = {
        let playerLayer = AVPlayerLayer(player: self.player)
        playerLayer.frame = self.view.bounds
        return playerLayer
    }()
    
    
    //登录按钮
    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton(frame: CGRect(x: 30, y: screenHeight - 130, width: screenWidth - 60, height: 45))
        loginBtn.backgroundColor = UIColor(red: 23/255.0, green: 164/255.0, blue: 5/255.0, alpha: 1.0)
        loginBtn.layer.cornerRadius = 4
        loginBtn.layer.masksToBounds = true
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.setTitle("Login", for: .normal)
        return loginBtn
    }()

    
    //注册按钮
    lazy var signUPBtn: UIButton = {
        let signUPBtn = UIButton(frame: CGRect(x: 30, y: screenHeight - 65, width: screenWidth - 60, height: 45))
        signUPBtn.backgroundColor = .white
        signUPBtn.layer.cornerRadius = 4
        signUPBtn.layer.masksToBounds = true
        signUPBtn.setTitleColor(UIColor(red: 23/255.0, green: 164/255.0, blue: 5/255.0, alpha: 1.0), for: .normal)
        signUPBtn.setTitle("Sign Up", for: .normal)
        return signUPBtn
    }()
    
    
    lazy var logoView: UIImageView = {
        let logoView = UIImageView(frame: CGRect(x: 20, y: 40, width: screenWidth - 40, height: 80))
        logoView.contentMode = .scaleAspectFit
        logoView.image = UIImage(named: "logo")
        return logoView
    }()

}

