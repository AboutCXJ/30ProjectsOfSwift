//
//  ViewController.swift
//  Project 14 - EmojiSlotMachine
//
//  Created by sfzx on 2017/11/1.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - handle
    func setupUI() {
        self.view.addSubview(self.backImageView)
        self.view.addSubview(self.pickView)
        self.view.addSubview(self.resultLB)
        self.view.addSubview(self.rollingBtn)
    }
    
    @objc func rollingBtnClick() {
        let random1 = Int(arc4random()) % (self.datas.count - 1)
        let random2 = Int(arc4random()) % (self.datas.count - 1)
        let random3 = Int(arc4random()) % (self.datas.count - 1)
        self.pickView.selectRow(random1, inComponent: 0, animated: true)
        self.pickView.selectRow(random2, inComponent: 1, animated: true)
        self.pickView.selectRow(random3, inComponent: 2, animated: true)
        
        if self.datas[random1] == self.datas[random2] && self.datas[random2] == self.datas[random3] {
            self.resultLB.text = "Bingo"
        }else{
            self.resultLB.text = "💔"
        }
    }
    
    
    //MARK: - 懒加载
    lazy var backImageView: UIImageView = {
        let backImageView = UIImageView(frame: self.view.bounds)
        backImageView.image = UIImage(named: "backGround")
        return backImageView
    }()
    
    lazy var pickView: UIPickerView = {
        let pickView = UIPickerView(frame: CGRect(x: 0, y: (screenHeight - 300)*0.3, width: screenWidth, height: 300))
        pickView.isUserInteractionEnabled = false
        pickView.delegate = self
        pickView.dataSource = self
        return pickView
    }()
    
    lazy var resultLB: UILabel = {
        let resultLB = UILabel(frame: CGRect(x: (screenWidth-100)*0.5, y: screenHeight - 200, width: 100, height: 30))
        resultLB.font = UIFont.systemFont(ofSize: 25)
        resultLB.textColor = .white
        resultLB.textAlignment = .center
        return resultLB
    }()
    
    lazy var rollingBtn: UIButton = {
        let rollingBtn = UIButton(frame: CGRect(x: 50, y: screenHeight - 120, width: screenWidth-100, height: 50))
        rollingBtn.layer.cornerRadius = 5
        rollingBtn.layer.masksToBounds = true
        
        rollingBtn.backgroundColor = UIColor(red: 0.63, green: 1.0, blue: 0.05, alpha: 1.0)
        rollingBtn.setTitleColor(.white, for: .normal)
        rollingBtn.addTarget(self, action: #selector(rollingBtnClick), for: .touchUpInside)
        
        rollingBtn.setTitle("GO", for: .normal)
        
        return rollingBtn
    }()
    
    lazy var datas: [String] = {
        let tempDatas = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        var datas: [String] = [String]()
        for var i in 0..<10 {
            for emoji in tempDatas {
                datas.append(emoji)
            }
        }
        return datas
    }()

}

//MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return screenWidth/3
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.text = self.datas[row]
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }
}


//MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.datas.count
    }
    
    
}
