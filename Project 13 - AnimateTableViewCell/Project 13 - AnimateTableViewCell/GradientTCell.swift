//
//  GradientTCell.swift
//  Project 11 - GradientTableView
//
//  Created by sfzx on 2017/10/18.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit

class GradientTCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if !self.isEqual(nil) {
            self.textLabel?.textColor = .white
            self.textLabel?.textAlignment = .center
            self.textLabel?.backgroundColor = .clear
            self.textLabel?.font = UIFont(name: "Avenir Next", size: 15)
            self.selectionStyle = .none
            self.contentView.layer.addSublayer(self.gradientLayer)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradientLayer.frame = self.bounds
    }
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        
        let color1 = UIColor(white: 1.0, alpha: 0.2).cgColor
        let color2 = UIColor(white: 1.0, alpha: 0.1).cgColor
        let color3 = UIColor.clear.cgColor
        let color4 = UIColor(white: 0.0, alpha: 0.05).cgColor
        
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0, 0.25, 0.75, 1.0]
        
        
        return gradientLayer
    }()
    
}
