//
//  ViewController.swift
//  Project 04 - SnapChatMenu
//
//  Created by sfzx on 2017/10/12.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.scrollView)
        self.addChildVC()
    }
    
    
    func addChildVC()  {
        let leftVC = LeftViewController()
        self.scrollView.addSubview(leftVC.view)
        self.addChildViewController(leftVC)
        
        let centerVC = CenterViewController()
        var centerFrame = centerVC.view.frame
        centerFrame.origin.x = screenWidth
        centerVC.view.frame = centerFrame
        self.scrollView.addSubview(centerVC.view)
        self.addChildViewController(centerVC)
        
        
        let rightVC = RightViewController()
        var rightFrame = rightVC.view.frame
        rightFrame.origin.x = screenWidth*2
        rightVC.view.frame = rightFrame
        self.scrollView.addSubview(rightVC.view)
        self.addChildViewController(rightVC)
    }

    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: self.view.bounds)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize.init(width: screenWidth*3, height: 0)
        return scrollView
    }()
    
    //隐藏状态栏
    override var prefersStatusBarHidden: Bool{
        get{
            return true
        }
    }
}

