//
//  SecondAnimateVC.swift
//  Project 13 - AnimateTableViewCell
//
//  Created by sfzx on 2017/11/1.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit


fileprivate let gradientTCellID = "SecondAnimateVCID"

class SecondAnimateVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.animateTable()
    }
    
    func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(self.tableView)
    }
    
    override var prefersStatusBarHidden: Bool{
        get{
            return true
        }
    }
    
    //MARK: - handle
    func animateTable() {
        
        self.tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for (index, cell) in cells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
    
    
    
    //MARK: - 懒加载
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds)
        tableView.separatorStyle = .none
        tableView.register(GradientTCell.self, forCellReuseIdentifier: gradientTCellID)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    
    lazy var datas: [String] = {
        let datas = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]
        return datas
    }()
}


//MARK: - UITableViewDelegate
extension SecondAnimateVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

//MARK: - UITableViewDataSource
extension SecondAnimateVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: gradientTCellID, for: indexPath) as! GradientTCell
        cell.textLabel?.text = self.datas[indexPath.row]
        
        //渐变色
        let color = CGFloat(indexPath.row) / CGFloat(self.datas.count) * 0.8
        cell.backgroundColor = UIColor.init(red: 1.0, green: color, blue: 0, alpha: 1.0)
        
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let animation = CAKeyframeAnimation(keyPath: "transform")
//        animation.duration = 1.0
//        let values = [
//            NSValue(caTransform3D: CATransform3DMakeScale(0.5, 0.5, 1.0)),
//            NSValue(caTransform3D: CATransform3DMakeScale(1.5, 1.5, 1.0)),
//            NSValue(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)),
//            ]
//        animation.values = values
//
//        cell.layer.add(animation, forKey: nil)
//    }
}

