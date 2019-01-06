//
//  HomeView.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

extension HomeViewController: NaviSetting {
    
    func defaultNavi() {
        self.navigationItem.title = "HOME"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        naviSetting()
    }
    
    func naviSetting() {
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "edit"), style: .done, target: self, action: #selector(self.myPageClick))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        let leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "trophy"), style: .done, target: self, action: #selector(self.rankingClick))
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    func floatingButton() {
        btn.frame = CGRect(x: self.view.frame.width - 70 , y: self.view.frame.height - 85, width: 50, height: 50)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 25
        btn.setImage(UIImage(named: "floating"), for: .normal)
        btn.backgroundColor = UIColor.lightGray
        btn.addTarget(self,action: #selector(self.writeClick), for: UIControl.Event.touchUpInside)
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(btn)
        }
    }
}
