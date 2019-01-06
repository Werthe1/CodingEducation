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
        self.navigationItem.title = "MY QUESTION"
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func defaultView() {
        tableView.register(UINib(nibName:"QListTableViewCell",bundle: nil), forCellReuseIdentifier: "QCell")
    }
    
}


//MARK: tableview datasource and delegate

extension QViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QCell", for: indexPath) as! QListTableViewCell
        cell.titleLabel.text = listArray?[indexPath.row].title
        cell.dateLabel.text = listArray?[indexPath.row].createdTime
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        vc.getData = listArray?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
