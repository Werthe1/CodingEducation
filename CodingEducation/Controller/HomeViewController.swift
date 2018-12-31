//
//  HomeViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var btn = UIButton(type: .custom)

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        floatingButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        defaultNavi()
        
    }
    
    @objc func myPageClick() {
        self.performSegue(withIdentifier: "myPage", sender: self)
    }
    
    @objc func writeClick() {
        btn.removeFromSuperview()
        self.performSegue(withIdentifier: "Write", sender: self)
    }
    
}

//MARK: tableview datasource and delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "hello"
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

}
