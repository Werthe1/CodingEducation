//
//  AViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        defaultNavi()
        tableView.register(UINib(nibName:"QListTableViewCell",bundle: nil), forCellReuseIdentifier: "QCell")

    }

}

//MARK: tableview datasource and delegate

extension AViewController: UITableViewDelegate,  UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "채택된 답변"
        } else {
            return "내가단 답변"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QCell", for: indexPath) as! QListTableViewCell
        cell.titleLabel.text = "iOS는 생명주기가 어떻게 되고 Android는 어떻게 되나요?"
        cell.typeImageView.image = UIImage(named: "letter-a")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
