//
//  ViewController.swift
//  Project 11 - GradientTableView
//
//  Created by sfzx on 2017/10/18.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

fileprivate let gradientTCellID = "gradientTCellID"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        self.view.addSubview(self.tableView)
    }
    
    override var prefersStatusBarHidden: Bool{
        get{
            return true
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
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenHeight / CGFloat(self.datas.count)
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: gradientTCellID, for: indexPath) as! GradientTCell
        cell.textLabel?.text = self.datas[indexPath.row]
        
        //渐变色
        let color = CGFloat(indexPath.row) / CGFloat(self.datas.count) * 0.8
        cell.backgroundColor = UIColor.init(red: 0, green: color, blue: 1.0, alpha: 1.0)
        
        
        return cell
    }
}
