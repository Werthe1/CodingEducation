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
        defaultView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        btn.removeFromSuperview()
    }
    
    @objc func myPageClick() {
        self.performSegue(withIdentifier: "myPage", sender: self)
    }
    
    @objc func writeClick() {
        self.performSegue(withIdentifier: "Write", sender: self)
    }
    
}

//MARK: home default view
extension HomeViewController {
    func defaultView() {
        tableView.register(UINib(nibName:"QListTableViewCell",bundle: nil), forCellReuseIdentifier: "QCell")
    }
}

//MARK: tableview datasource and delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QCell", for: indexPath) as! QListTableViewCell
        cell.titleLabel.layer.cornerRadius = 3
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
