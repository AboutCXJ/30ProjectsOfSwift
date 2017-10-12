//
//  VideoListCell.swift
//  Project 03 - PlayLocalVideo
//
//  Created by sfzx on 2017/10/11.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit

struct VideoModel {
    var image: String
    var title: String
    var source: String
}

class VideoListCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if !self.isEqual(nil){
            self.selectionStyle = .none
            self.contentView.addSubview(self.preview)
            self.contentView.addSubview(self.titleLB)
            self.contentView.addSubview(self.playIcon)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
//        self.preview.frame = self.frame
    }

    
    var cellModel: VideoModel! {
        didSet{
            self.titleLB.text = cellModel.title
            self.preview.image = UIImage(named: cellModel.image)
        }
    }
    
    
    
    //预览图
    lazy var preview: UIImageView = {
        let preview = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 200))
        return preview
    }()
    
    //影片标题
    lazy var titleLB: UILabel = {
        let titleLB = UILabel.init(frame: CGRect.init(x: (screenWidth-200)*0.5, y: 200-50, width: 200, height: 30))
        titleLB.font = .systemFont(ofSize: 15)
        titleLB.textColor = .white
        titleLB.textAlignment = .center
        return titleLB
    }()
    
    
    //播放
    lazy var playIcon: UIImageView = {
        let playIcon = UIImageView.init(frame: CGRect.init(x: (screenWidth-80)*0.5, y: 60, width: 80, height: 80))
        playIcon.image = UIImage(named: "playBtn")
        return playIcon
    }()
    
    
}
