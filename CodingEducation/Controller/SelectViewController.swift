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
    
    var ranking = ["김혜리":3,"이지윤":2,"김준용":2,"김만기":1,"박소희":1,"김보미":1,"고은진":1,"이혜민":1,"김혜진":1,"박혜리":1,"정민정":1,"이유나":1,"이태낭":1,"정나현":1,"김혜민":1,"김정훈":1,"윤진한":1,"최예준":1,"윤택한":1,"박봄":1,"박하은":1,"최희준":1]
    var select = [6,4,3,2,2,2,2,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0]
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
        cell.nameLabel.text = ranking.map({$0.key})[indexPath.row]
        cell.levelLabel.text = "level: " + String(ranking.map({$0.value}).sorted().reversed()[indexPath.row])
        cell.selectLabel.text = "채택받은 답 \(select.sorted().reversed()[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ranking.count
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
