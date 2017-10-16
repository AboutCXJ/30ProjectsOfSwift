//
//  ViewController.swift
//  Project 07 - PullToRefresh
//
//  Created by sfzx on 2017/10/16.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit

let cellID = "cellID"


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "下拉刷新"
        self.setupUI()
    }
    
    
    func setupUI() {
        self.view.addSubview(self.tableView)
        self.tableView.addSubview(self.refreshCtr)
    }
    
    
    //下拉刷新
    @objc func refreshHead() {
        //延迟2秒，模仿网络请求
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            for emoji in self.newDatas {
                self.datas.append(emoji)
            }
            self.tableView.reloadData()
            self.refreshCtr.endRefreshing()
        }
    }
    
    
    //MARK: - 懒加载
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    
    lazy var refreshCtr: UIRefreshControl = {
        let refreshCtr = UIRefreshControl()
        refreshCtr.addTarget(self, action: #selector(refreshHead), for: .valueChanged)
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        refreshCtr.attributedTitle = NSAttributedString.init(string: "下拉刷新", attributes: attributes)
        return refreshCtr
    }()
    

    lazy var newDatas: [String] = {
        let newDatas = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
        return newDatas
    }()
    
    lazy var datas: [String] = {
        let datas = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
        return datas
    }()
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
}


//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = self.datas[indexPath.row]
        return cell
    }
}

