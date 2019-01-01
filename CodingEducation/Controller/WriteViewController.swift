//
//  WriteViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultNavi()
    }
    
    @IBAction func imageTapped(_ sender: Any) {

        
    }
}

extension WriteViewController: NaviSetting {
    
    func defaultNavi() {
        self.navigationItem.title = "글쓰기"
        naviSetting()
    }
    
    func naviSetting() {
        let rightBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(self.saveClick))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func saveClick() {
        self.performSegue(withIdentifier: "Save", sender: self)
    }
}
