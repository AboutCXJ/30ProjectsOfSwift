//
//  ViewController.swift
//  Project 09 -ImageScroller
//
//  Created by sfzx on 2017/10/17.
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
        self.view.addSubview(self.bgImageView)
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.imageView)
    }
    
    //状态栏
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    //MARK: - 懒加载
    
    //背景
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView(frame: self.view.bounds)
        bgImageView.image = UIImage(named: "image")
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = bgImageView.frame
        
        bgImageView.addSubview(blurView)
        return bgImageView
    }()
    
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.backgroundColor = .clear
        scrollView.contentSize = self.imageView.bounds.size
        scrollView.delegate = self
        scrollView.maximumZoomScale = 5.0
        scrollView.minimumZoomScale = 1.0
        return scrollView
    }()
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "image")
        return imageView
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}

