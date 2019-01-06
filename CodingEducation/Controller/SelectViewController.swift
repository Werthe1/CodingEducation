//
//  SelectViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 04/01/2019.
//  Copyright © 2019 hyerikim. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName:"RankingTableViewCell",bundle: nil), forCellReuseIdentifier: "Cell")
        self.navigationItem.title = "RANKING🙏"
    }
    

}

extension SelectViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RankingTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "질문을 하시겠습니까?", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "네", style: .default, handler: {
            action in
            let st = self.storyboard?.instantiateViewController(withIdentifier: "Write") as! WriteViewController
            self.navigationController?.pushViewController(st, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "아니요", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
