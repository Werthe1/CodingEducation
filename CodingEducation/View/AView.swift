//
//  AView.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

extension AViewController: NaviSetting {
    
    func defaultNavi() {
        self.navigationItem.title = "내 답변"
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func defaultView() {
        tableView.register(UINib(nibName:"QListTableViewCell",bundle: nil), forCellReuseIdentifier: "QCell")
    }
    
}

//MARK: tableview datasource and delegate

extension AViewController: UITableViewDelegate,  UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tableViewWidth = self.tableView.bounds
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableViewWidth.size.width, height: tableView.sectionHeaderHeight))
        
        let label = UILabel()
        label.textColor = UIColor.white
        
        switch section {
        case 0:
            label.text = "😇채택된 답변😇"
        default:
            label.text = "😊내가 단 답변😊"
        }
        
        label.frame = headerView.frame
        headerView.addSubview(label)
        headerView.backgroundColor = UIColor.gray
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QCell", for: indexPath) as! QListTableViewCell
        cell.typeImageView.image = UIImage(named: "Answer")
        cell.titleLabel.text = "iOS는 생명주기가 어떻게 되고 Android는 어떻게 되나요?"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
