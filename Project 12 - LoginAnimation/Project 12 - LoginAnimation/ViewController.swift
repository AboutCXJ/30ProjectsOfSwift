//
//  ViewController.swift
//  Project 12 - LoginAnimation
//
//  Created by sfzx on 2017/10/19.
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

    func setupUI() {
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor(red: 28/255.0, green: 155/255.0, blue: 5/255.0, alpha: 1.0)
        self.view.addSubview(loginBtn)
        self.view.addSubview(signUPBtn)
        self.view.addSubview(logoView)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        get{
            return UIStatusBarStyle.lightContent
        }
    }
    
    
    @objc func goLoginVC() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    
    //    MARK: - 懒加载
    
    //登录按钮
    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton(frame: CGRect(x: 30, y: screenHeight - 130, width: screenWidth - 60, height: 45))
        loginBtn.backgroundColor = UIColor(red: 23/255.0, green: 139/255.0, blue: 3/255.0, alpha: 1.0)
        loginBtn.layer.cornerRadius = 4
        loginBtn.layer.masksToBounds = true
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.setTitle("Login", for: .normal)
        
        loginBtn.addTarget(self, action: #selector(goLoginVC), for: .touchUpInside)
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
    
    
    //logo
    lazy var logoView: UIImageView = {
        let logoView = UIImageView(frame: CGRect(x: 20, y: 40, width: screenWidth - 40, height: 80))
        logoView.contentMode = .scaleAspectFit
        logoView.image = UIImage(named: "logo")
        return logoView
    }()
    


}

