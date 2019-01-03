//
//  WriteViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import RealmSwift

class WriteViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBAction func imageTapped(_ sender: Any) {
        createImagePicker()
    }
    
    let realm = try! Realm()
    var listArray: Results<CoalaModel>?

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultNavi()
    }

}

extension WriteViewController: NaviSetting {
    
    func defaultNavi() {
        self.navigationItem.title = "글쓰기"
        naviSetting()
    }
    
    func naviSetting() {
        let rightBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(self.saveClick))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func saveClick() {
        let new = CoalaModel()
        //뭐 저장할지 지정
        save(coalaList: new)
        self.performSegue(withIdentifier: "Save", sender: self)
    }
    
    func save(coalaList: CoalaModel) {
        do{
            try realm.write{
                realm.add(coalaList)
            }
        } catch {
            print("error")
        }
    }
    
    func convertImgToData(img getImage: UIImage) -> NSData? {
        if let data = getImage.pngData() as NSData? {
            return data
        }
        return nil
    }
    
}
