//
//  HomeViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import RealmSwift

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var btn = UIButton(type: .custom)
    var listArray: Results<CoalaModel>?
    let realm = try! Realm()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        floatingButton()
        loadList()
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
    
    @objc func rankingClick() {
        self.performSegue(withIdentifier: "ranking", sender: self)
    }
    
    @objc func myPageClick() {
        self.performSegue(withIdentifier: "myPage", sender: self)
    }
    
    @objc func writeClick() {
        self.performSegue(withIdentifier: "Write", sender: self)
    }
    
    func loadList() {
        listArray = realm.objects(CoalaModel.self)
        self.tableView.reloadData()
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
        cell.titleLabel.text = listArray?[indexPath.row].title
        cell.dateLabel.text = listArray?[indexPath.row].createdTime
        cell.nameLabel.text = "이지윤"
        cell.countLabel.text = "답변수 0 좋아요 0개"
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray?.count ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        vc.getData = listArray?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
