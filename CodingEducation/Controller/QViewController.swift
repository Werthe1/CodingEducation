//
//  QViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import RealmSwift

class QViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var listArray: Results<CoalaModel>?
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        defaultNavi()
        defaultView()
        loadList()
    }

    func loadList() {
        listArray = realm.objects(CoalaModel.self)
        self.tableView.reloadData()
    }
    
}

//MARK: tableview datasource and delegate

extension QViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QCell", for: indexPath) as! QListTableViewCell
        cell.titleLabel.text = listArray?[indexPath.row].title
        cell.dateLabel.text = listArray?[indexPath.row].createdTime
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
