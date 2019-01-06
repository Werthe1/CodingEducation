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
    var commentList = [String]()
    var check = false
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName:"AListTableViewCell",bundle: nil), forCellReuseIdentifier: "ACell")
        tableView.register(UINib(nibName: "EmptyTableViewCell", bundle: nil), forCellReuseIdentifier: "ECell")
        tableView.register(UINib(nibName: "EditTableViewCell", bundle: nil), forCellReuseIdentifier: "EditCell")

        let rightBarButtonItem = UIBarButtonItem.init(title: "댓글 작성", style: .done, target: self, action: #selector(self.plusButton))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
  
    @objc func plusButton() {
//        print("right button clicked")
//        let st = self.storyboard?.instantiateViewController(withIdentifier: "WriteComment") as! WriteCommentViewController
//        st.delegate = self
//        st.modalPresentationStyle = .overCurrentContext
//        self.present(st, animated: true, completion: nil)
        check = true
        let rightBarButtonItem = UIBarButtonItem.init(title: "작성 완료", style: .done, target: self, action: #selector(self.done))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        tableView.reloadData()
        
    }
    
    @objc func done() {
        let rightBarButtonItem = UIBarButtonItem.init(title: "댓글 작성", style: .done, target: self, action: #selector(self.plusButton))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! EditTableViewCell
        commentList.append(cell.textView.text)
        check = false
        self.tableView.reloadData()
    }
    
    @IBAction func tapImage(_ sender: Any) {
        let st = self.storyboard?.instantiateViewController(withIdentifier: "Image") as! ImageViewController
        if let getImage = getData?.image1 as Data? {
            st.myImage = UIImage(data: getImage)
        }
        if let getImage = getData?.image2 as Data? {
            st.my2Image = UIImage(data: getImage)
        }
        if let getImage = getData?.image3 as Data? {
            st.myImage = UIImage(data: getImage)
        }
        
        self.navigationController?.pushViewController(st, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

extension DetailViewController: CommentDelegate {
    func comment(content: String) {
        commentList.append(content)
        tableView.reloadData()
    }
    
}

//MARK: tableview delegate and datasource
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if commentList.count == 0 {
            return 2
        } else {
            if check {
                return commentList.count + 2
            }
            return commentList.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell
            cell.titleLabel.text = getData?.title
            cell.descLabel.text = getData?.descript
           print(getData)
            if let getImage = getData?.image1 as Data? {
                cell.qImageView.image = UIImage(data: getImage)
            }
            if let getImage = getData?.image2 as Data? {
                cell.wImageView.image = UIImage(data: getImage)
            }
            if let getImage = getData?.image3 as Data? {
                cell.eImageView.image = UIImage(data: getImage)
            }
            
            return cell
        } else {
            if indexPath.row == 1 {
                if check {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "EditCell", for: indexPath) as! EditTableViewCell
                    cell.awakeFromNib()
                    return cell
                }
            }
                
            if commentList.count == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ECell", for: indexPath) as! EmptyTableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ACell", for: indexPath) as! AListTableViewCell
                if check {
                    cell.mtLabel.text = commentList[indexPath.row-2]
                } else {
                    cell.mtLabel.text = commentList[indexPath.row-1]
                }
                return cell
            }
        }
    }
    
}

