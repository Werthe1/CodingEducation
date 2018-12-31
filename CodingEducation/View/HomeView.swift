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
        self.navigationItem.title = "홈"
        naviSetting()
    }
    
    func naviSetting() {
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "userTab"), style: .done, target: self, action: #selector(self.myPageClick))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func floatingButton(){
        btn.frame = CGRect(x: self.view.frame.width - 100 , y: self.view.frame.height - 150, width: 64, height: 64)
        btn.backgroundColor = UIColor.black
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 32
        btn.addTarget(self,action: #selector(self.writeClick), for: UIControl.Event.touchUpInside)
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(btn)
        }
    }
}
