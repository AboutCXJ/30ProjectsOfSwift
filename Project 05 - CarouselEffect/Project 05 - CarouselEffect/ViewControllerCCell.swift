//
//  ViewControllerCCell.swift
//  Project 05 - CarouselEffect
//
//  Created by sfzx on 2017/10/13.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit

let cellWidth = 300
let cellHeight = 450


struct ViewControllerCCellModel {
    var image: String
    var title: String
    
    
}


class ViewControllerCCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if !self.isEqual(nil){
            self.contentView.addSubview(imageView)
            self.contentView.addSubview(blurView)
            self.blurView.contentView.addSubview(titleLB)
            self.layer.cornerRadius = 5.0
            self.layer.masksToBounds = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    var cellModel: ViewControllerCCellModel!{
        didSet{
            self.imageView.image = UIImage.init(named: cellModel.image)
            self.titleLB.text = cellModel.title
        }
    }
    
    
    //MARK: - 懒加载
    
    //图片
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: cellWidth, height: cellHeight))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //高斯模糊
    lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect.init(style: .light)
        let blurView = UIVisualEffectView.init(effect: blurEffect)
        blurView.frame = CGRect.init(x: 0, y: cellHeight - 50, width: cellWidth, height: 50)
        return blurView
    }()
    
    //标题
    lazy var titleLB: UILabel = {
        let titleLB = UILabel.init(frame: CGRect.init(x: 10, y: 10, width: cellWidth-20, height: 30))
        titleLB.font = UIFont.systemFont(ofSize: 16)
        titleLB.textColor = .white
        return titleLB
    }()
    
}
