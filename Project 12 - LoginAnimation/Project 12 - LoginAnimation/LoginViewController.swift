//
//  LoginViewController.swift
//  Project 12 - LoginAnimation
//
//  Created by sfzx on 2017/10/19.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.pwTF.frame.origin.x -= self.view.bounds.size.width
        self.nameTF.frame.origin.x -= self.view.bounds.size.width
        self.loginBtn.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5) {
            self.pwTF.frame.origin.x += self.view.bounds.size.width
            self.nameTF.frame.origin.x += self.view.bounds.size.width
            self.loginBtn.alpha = 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        //        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor(red: 28/255.0, green: 155/255.0, blue: 5/255.0, alpha: 1.0)
        
        self.view.addSubview(self.nameTF)
        self.view.addSubview(self.pwTF)
        self.view.addSubview(self.loginBtn)
        self.view.addSubview(self.titleLB)
        self.view.addSubview(self.backBtn)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        get{
            return UIStatusBarStyle.lightContent
        }
    }
    
    
    //MARK: - handle
    @objc func loginBtnClick() {
        self.loginBtn.layer.add(animate(), forKey: nil)
    }
    
    @objc func backBtnClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - 懒加载
    
    //用户名
    lazy var nameTF: UITextField = {
        let nameTF = UITextField(frame: CGRect(x: 30, y: 93, width: screenWidth - 60, height: 50))
        nameTF.backgroundColor = .white
        nameTF.borderStyle = .roundedRect
        nameTF.font = UIFont(name: "Avenir Next", size: 20)
        nameTF.placeholder = "username"
        return nameTF
    }()
    
    
    //密码
    lazy var pwTF: UITextField = {
        let pwTF = UITextField(frame: CGRect(x: 30, y: 163, width: screenWidth - 60, height: 50))
        pwTF.backgroundColor = .white
        pwTF.borderStyle = .roundedRect
        pwTF.font = UIFont(name: "Avenir Next", size: 20)
        pwTF.placeholder = "password"
        return pwTF
    }()
    
    
    //登录按钮
    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton(frame: CGRect(x: 100, y: 230 , width: screenWidth - 200, height: 45))
        loginBtn.backgroundColor = UIColor(red: 23/255.0, green: 139/255.0, blue: 3/255.0, alpha: 1.0)
        loginBtn.layer.cornerRadius = 4
        loginBtn.layer.masksToBounds = true
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        return loginBtn
    }()
    
    
    //标题
    lazy var titleLB: UILabel = {
        let titleLB = UILabel(frame: CGRect(x: screenWidth - 200, y: 20, width: 100, height: 40))
         titleLB.font = UIFont(name: "Avenir Next", size: 22)
        titleLB.textAlignment = .center
        titleLB.textColor = .white
        titleLB.text = "Welcome"
        return titleLB
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(frame: CGRect(x: 15, y: 20, width: 40, height: 40))
        backBtn.setImage(UIImage(named: "Back-icon"), for: .normal)
        backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        return backBtn
    }()
    
    
}
