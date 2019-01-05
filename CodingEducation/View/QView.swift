//
//  QView.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

extension QViewController: NaviSetting {
    
    func defaultNavi() {
        self.navigationItem.title = "내 질문"
    }
    
    func defaultView() {
        tableView.register(UINib(nibName:"QListTableViewCell",bundle: nil), forCellReuseIdentifier: "QCell")
    }
    
}
