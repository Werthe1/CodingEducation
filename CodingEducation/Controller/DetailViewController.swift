//
//  DetailViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var getData:CoalaModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName:"AListTableViewCell",bundle: nil), forCellReuseIdentifier: "ACell")

    }

}

//MARK: tableview delegate and datasource
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell
            cell.titleLabel.text = getData?.title
            cell.descLabel.text = getData?.descript
           
            if let getImage = getData?.image1 as Data? {
                cell.qImageView.image = UIImage(data: getImage)
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ACell", for: indexPath) as! AListTableViewCell
            
            return cell
        }
    }
    
}
