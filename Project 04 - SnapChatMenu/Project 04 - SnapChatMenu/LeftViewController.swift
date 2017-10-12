//
//  LeftViewController.swift
//  Project 04 - SnapChatMenu
//
//  Created by sfzx on 2017/10/12.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.imageView)
        // Do any additional setup after loading the view.
    }

    
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: self.view.bounds)
        imageView.image = UIImage.init(named: "left")
        return imageView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
