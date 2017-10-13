//
//  ViewController.swift
//  Project 05 - CarouselEffect
//
//  Created by sfzx on 2017/10/13.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height


fileprivate let viewControllerCCellID = "viewControllerCCellID"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupUI()
    }

    func setupUI()  {
        self.view.addSubview(self.bgView)
        self.view.addSubview(self.collectionView)
    }
    
    
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize.init(width: cellWidth, height: cellHeight)
        let collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(ViewControllerCCell.self, forCellWithReuseIdentifier: viewControllerCCellID)
        collectionView.contentInset = UIEdgeInsets.init(top: 50, left: 50, bottom: 50, right: 50)
        return collectionView
    }()
    
    //背景：模糊
    lazy var bgView: UIImageView = {
        let bgview = UIImageView.init(frame: self.view.bounds)
        bgview.image = UIImage.init(named: "blue")
        let blurEffect = UIBlurEffect.init(style: .light)
        let blurView = UIVisualEffectView.init(effect: blurEffect)
        blurView.frame = bgview.bounds
        bgview.addSubview(blurView)
        return bgview
    }()
    
    lazy var datas: [ViewControllerCCellModel] = {
        let datas = [ViewControllerCCellModel(image:"hello", title: "Hello there, i miss u."),
        ViewControllerCCellModel(image:"dudu", title: "🐳🐳🐳🐳🐳"),
        ViewControllerCCellModel(image:"bodyline", title: "Training like this, #bodyline"),
        ViewControllerCCellModel(image:"wave", title: "I'm hungry, indeed."),
        ViewControllerCCellModel(image:"darkvarder", title: "Dark Varder, #emoji"),
        ]
        return datas
    }()

}


extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewControllerCCellID, for: indexPath) as! ViewControllerCCell
        cell.cellModel = self.datas[indexPath.row]
        return cell
    }
}
