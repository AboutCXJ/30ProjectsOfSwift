//
//  ViewController.swift
//  Project 01 - SimpleStopWatch
//
//  Created by sfzx on 2017/10/10.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

fileprivate let timeInterval = 0.1

class ViewController: UIViewController {
    var isTiming:Bool = false
    var currentTime:Double = 0.00
    var timer:Timer?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    
    func setupUI() {
        self.view.addSubview(self.playBtn)
        self.view.addSubview(self.timeLB)
        self.view.addSubview(self.resetBtn)
        
    }
    
    
    //MARK: - handle
    //计时事件
    @objc  func playBtnClick() {
        if isTiming {
            isTiming = false
            playBtn .setImage(UIImage(named: "play"), for: .normal)
            self.timer?.invalidate()
        }else{
            isTiming = true
            playBtn .setImage(UIImage(named: "pause"), for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
        }
    }
    
    //定时器事件
    @objc  func timeAction() {
        currentTime += timeInterval
        self.timeLB.text = String.init(format: "%.1f", currentTime)
    }
    
    
    //重置事件
    @objc func resetBtnClick() {
        if !isTiming {
            self.timeLB.text = "0.0"
            self.currentTime = 0
        }
    }
    
    
    
    
    
    //MARK: - 懒加载
    //计时按钮
    lazy var playBtn: UIButton = {
        let playBtn = UIButton(frame: CGRect(x: screenWidth*0.5, y: screenHeight*0.5, width: screenWidth*0.5, height: screenHeight*0.5))
        playBtn.backgroundColor = UIColor(red: 66/255.0, green: 75/255.0, blue: 226/255.0, alpha: 1.0)
        playBtn .setImage(UIImage(named: "play"), for: .normal)
        playBtn.addTarget(self, action: #selector(playBtnClick), for: .touchUpInside)
        return playBtn
    }()
    
    
    //计时LB
    lazy var timeLB: UILabel = {
        let timeLB = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight*0.5))
        timeLB.font = .systemFont(ofSize: 100, weight: .ultraLight)
        timeLB.textAlignment = .center
        timeLB.textColor = .white
        timeLB.backgroundColor = .black
        timeLB.text = "0.0"
        return timeLB
    }()
    
    //重置按钮
    lazy var resetBtn: UIButton = {
        let resetBtn = UIButton(frame: CGRect(x: 0, y: screenHeight*0.5, width: screenWidth*0.5, height: screenHeight*0.5))
        resetBtn.setTitle("重置", for: .normal)
        resetBtn.titleLabel?.font = .systemFont(ofSize: 50, weight: .ultraLight)
        resetBtn.backgroundColor = UIColor.red
        resetBtn.addTarget(self, action: #selector(resetBtnClick), for: .touchUpInside)
        return resetBtn
    }()
    
}

