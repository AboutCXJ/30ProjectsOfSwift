//
//  ViewController.swift
//  Project 06 - FindMyLocation
//
//  Created by sfzx on 2017/10/16.
//  Copyright © 2017年 陈鑫杰. All rights reserved.
//

import UIKit
import CoreLocation

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        self.view.addSubview(self.locationLB)
        self.view.addSubview(self.locationBtn)
    }
    
    @objc  func locationBtnClick()  {
        if self.isLocation {
            self.locationBtn.setTitle("Find my location", for: .normal)
            self.locationManger.stopUpdatingLocation()
            self.isLocation = false
        }else{
            self.locationManger.requestWhenInUseAuthorization()
            self.locationManger.startUpdatingLocation()
            self.locationBtn.setTitle("Stop", for: .normal)
            self.isLocation = true
        }
    }
    
    
    var isLocation:Bool = false
    
    
    //地址lb
    lazy var locationLB: UILabel = {
        let locationLB = UILabel.init(frame: CGRect.init(x: 10, y: 100, width: screenWidth-20, height: 30))
        locationLB.textColor = .black
        locationLB.font = UIFont.systemFont(ofSize: 15)
        locationLB.textAlignment = .center
        locationLB.text = "My Location"
        locationLB.numberOfLines = 0
        return locationLB
    }()
    
    
    //定位Btn
    lazy var locationBtn: UIButton = {
        let locationBtn = UIButton.init(frame: CGRect.init(x: 15, y:screenHeight - 100, width: screenWidth-30, height: 70))
        locationBtn.setTitle("Find my location", for: .normal)
        locationBtn.addTarget(self, action: #selector(locationBtnClick), for: .touchUpInside)
        locationBtn.backgroundColor = UIColor.init(red: 108/255.0, green: 123/255.0, blue: 139/255.0, alpha: 1.0)
        locationBtn.layer.cornerRadius = 35.0
        locationBtn.layer.masksToBounds = true
        return locationBtn
    }()
    
    //定位管理器
    lazy var locationManger: CLLocationManager = {
        let locationManger = CLLocationManager()
        locationManger.delegate = self
        return locationManger
    }()
    
    //地理编码器
    lazy var locationGeo: CLGeocoder = {
        let locationGeo = CLGeocoder()
        return locationGeo
    }()
}


//MARK: - CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            self.locationGeo.reverseGeocodeLocation(locations.first!, completionHandler: { (marks, error) in
                if error != nil {
                    self.locationLB.text = "\(error?.localizedDescription  ?? "")"
                    return
                }
                
                if let mark = marks?.first {
                    self.locationLB.text = "\(mark.locality ?? "")\(mark.subLocality ?? "")\(mark.thoroughfare ?? "")"
                }
            })
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationLB.text = "error: \(error.localizedDescription)"
    }
}

