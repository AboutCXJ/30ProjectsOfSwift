//
//  ViewController.swift
//  Project 02 - CustomFont
//
//  Created by sfzx on 2017/10/10.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

class ViewController: UIViewController {
    
    let fonts = ["MFJunYa_Noncommercial-Regular","MF-TongZhen-Noncommercial-Regular","MFYueHei_Noncommercial-Regular"]
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        for family in UIFont.familyNames {
        //            print("font-family:",family)
        //            for font in UIFont.fontNames(forFamilyName: family) {
        //                print("font-name:",font)
        //            }
        //        }
        self.setupUI()
        
    }
    
    func setupUI() {
        self.view.backgroundColor = .black
        self.view.addSubview(self.textView)
        self.view .addSubview(self.changeFontBtn)
    }
    
    
    //MARK: - handle
    
    @objc func changeFontBtnClick() {
        index = (index + 1)%fonts.count
        self.textView.font = UIFont.init(name: fonts[index], size: 18)
    }
    
    
    //MARK: - 懒加载
    
    //textView
    lazy var textView: UITextView = {
        let textView = UITextView.init(frame: CGRect.init(x: 25, y: 64, width: screenWidth-50, height: screenHeight-64))
        textView.font = UIFont.init(name: "MFJunYa_Noncommercial-Regular", size: 18)
        textView.textColor = .white
        textView.backgroundColor = .clear
        textView.text = """
        30 Days Of Swift
        自定义字体
        使用[造字工坊] 俊雅体、童真体、悦黑体
        """
        return textView
    }()
    
    
    //改变字体按钮
    lazy var changeFontBtn: UIButton = {
        let changeFontBtn = UIButton.init(frame: CGRect.init(x: (screenWidth-100)*0.5, y: screenHeight-110, width: 100, height: 100))
        changeFontBtn.setTitle("change font", for: .normal)
        changeFontBtn.titleLabel?.font = UIFont.init(name: "MFJunYa_Noncommercial-Regular", size: 20)
        changeFontBtn.setTitleColor(.black, for: .normal)
        changeFontBtn.backgroundColor = UIColor.init(red: 216/255.0, green: 221/255.0, blue: 15/255.0, alpha: 1.0)
        changeFontBtn.addTarget(self, action: #selector(changeFontBtnClick), for: .touchUpInside)
        changeFontBtn.layer.masksToBounds = true
        changeFontBtn.layer.cornerRadius = 50
        return changeFontBtn
    }()
    
    
}

