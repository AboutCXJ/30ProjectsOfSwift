//
//  ViewController.swift
//  Project 08 - RandomGradientColor
//
//  Created by sfzx on 2017/10/17.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit
import AVKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height


class ViewController: UIViewController {
    
    var isPlay: Bool = false
    var timer: Timer?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupUI()
    }
    
    
    func setupUI()  {
        self.view.layer.addSublayer(self.gradientLayer)
        self.view.addSubview(self.playBtn)
    }
    
    
    //MARK: - handle
    
    @objc func playBtnClick() {
        if self.isPlay {
            self.isPlay = false
            self.player.pause()
            self.timer?.invalidate()
            self.timer = nil
        }else{
            self.isPlay = true
            self.player.play()
        self.timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
        }
    }
    
    
   @objc func timeAction()  {
    let redValue = CGFloat(drand48())
    let blueValue =  CGFloat(drand48())
    let greenValue = CGFloat(drand48())
    
    self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    
    //MARK: - 懒加载
    
    //渐变色
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor
        let color3 = UIColor(red: 0, green: 1.0, blue: 0, alpha: 0.3).cgColor
        let color4 = UIColor(red: 0, green: 0, blue: 1.0, alpha: 0.3).cgColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor
        
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
        return gradientLayer
    }()
    
    
    lazy var playBtn: UIButton = {
        let playBtn = UIButton.init(frame: CGRect.init(x: (screenWidth-100)*0.5, y: (screenHeight-100)*0.5, width: 100, height: 100))
        playBtn.setImage(UIImage(named: "music play"), for: .normal)
        playBtn.addTarget(self, action: #selector(playBtnClick), for: .touchUpInside)
        return playBtn
    }()
    
    lazy var player: AVPlayer = {
        let path = Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")
        let url = URL.init(fileURLWithPath: path!)
        let player = AVPlayer.init(url: url)
        return player
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

