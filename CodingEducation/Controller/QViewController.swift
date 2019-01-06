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
