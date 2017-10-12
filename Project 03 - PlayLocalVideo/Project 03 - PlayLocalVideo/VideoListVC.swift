//
//  VideoListVC.swift
//  Project 03 - PlayLocalVideo
//
//  Created by sfzx on 2017/10/11.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit
import AVKit


let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height


fileprivate let videoListCellID = "videoListCellID"

class VideoListVC: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "视频列表"
        self.view.addSubview(self.tableView)
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds)
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(VideoListCell.self, forCellReuseIdentifier: videoListCellID)
        self.view.addSubview(tableView)
        return tableView
    }()
    
    
    lazy var datas: [VideoModel] = {
        let datas = [
        VideoModel(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        VideoModel(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        VideoModel(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        VideoModel(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        VideoModel(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        VideoModel(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        ]
        return datas
    }()
}


//MARK: - UITableViewDelegate
extension VideoListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerVC = AVPlayerViewController.init()
        let path = Bundle.main.path(forResource: "L", ofType: "mp4")
        playerVC.player = AVPlayer.init(url: URL.init(fileURLWithPath: path!))
//        self.navigationController?.pushViewController(playerVC, animated: true)
        self.present(playerVC, animated: true) {
            playerVC.player?.play()
        }
        
    }
}

//MARK: - UITableViewDataSource
extension VideoListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell =  tableView.dequeueReusableCell(withIdentifier: videoListCellID, for: indexPath) as! VideoListCell
        cell.cellModel = self.datas[indexPath.row]
        return cell
    }
}
