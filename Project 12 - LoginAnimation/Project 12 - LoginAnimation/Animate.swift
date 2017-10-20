//
//  Animate.swift
//  Project 12 - LoginAnimation
//
//  Created by sfzx on 2017/10/20.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit


func animate() -> CAKeyframeAnimation {
    //动画
    let animation = CAKeyframeAnimation(keyPath: "transform")
    animation.duration = 0.5
    let values = [NSValue(caTransform3D: CATransform3DMakeScale(1.5, 1.5, 1.0)),
                  NSValue(caTransform3D: CATransform3DMakeScale(0.5, 0.5, 1.0)),
                  NSValue(caTransform3D: CATransform3DMakeScale(1.5, 1.5, 1.0)),
                  NSValue(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)),
                  ]
    animation.values = values
    return animation
}
