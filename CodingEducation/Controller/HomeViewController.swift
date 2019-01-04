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
    let cellSpacingHeight: CGFloat = 10

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
        cell.titleLabel.text = listArray?[indexPath.section].title
        cell.dateLabel.text = listArray?[indexPath.section].createdTime
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return listArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        vc.getData = listArray?[indexPath.section]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
