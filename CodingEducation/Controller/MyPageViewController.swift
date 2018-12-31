//
//  MyPageViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

//MARK: tableview datasource and delegate
extension MyPageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyPageTableViewCell
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! MyPageTableViewCell
            switch indexPath.row {
            case 1:
                cell.menuLabel.text = "나의 랭킹"
            case 2:
                cell.menuLabel.text = "나의 코인"
            case 3:
                cell.menuLabel.text = "나의 질문"
            default:
                cell.menuLabel.text = "나의 답변"
            }
            return cell
        }
    }
    
    
}
