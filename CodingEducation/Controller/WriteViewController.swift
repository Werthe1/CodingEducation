//
//  WriteViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import RealmSwift

class WriteViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    let realm = try! Realm()
    var listArray: Results<CoalaModel>?

    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.delegate = self
        defaultNavi()
    }
    
    @IBAction func imageTapped(_ sender: Any) {
        createImagePicker()
    }

}

extension WriteViewController: NaviSetting {
    
    func defaultNavi() {
        self.navigationItem.title = "글쓰기"
        naviSetting()
        contentTextView.text = "질문을 입력하세요."
        contentTextView.textColor = UIColor.lightGray
    }
    
    func naviSetting() {
        let selectBarButtonItem = UIBarButtonItem(title: "👑", style: .done, target: self, action: #selector(self.selectClick))
        let rightBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(self.saveClick))
        self.navigationItem.rightBarButtonItems = [rightBarButtonItem,selectBarButtonItem]
    }
    
    @objc func selectClick() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "select") as! SelectViewController
        vc.delegate = self
        vc.check = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func saveClick() {
        let new = CoalaModel()
        guard let title = titleTextField.text else {return}
        guard let descript = contentTextView.text else {return}
        
        new.title = title
        new.descript = descript
        new.createdTime = createTime()

        
        if imageView1.image != nil {
            if let image = imageView1.image {
                new.image1 = convertImgToData(img: image)
            }
        }
        if imageView2.image != nil {
            if let image = imageView2.image {
                new.image2 = convertImgToData(img: image)
            }
        }
        if imageView3.image != nil {
            if let image = imageView3.image {
                new.image3 = convertImgToData(img: image)
            }
        }
        
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func convertImgToData(img getImage: UIImage) -> NSData? {
        if let data = getImage.pngData() as NSData? {
            return data
        }
        return nil
    }
    
    func createTime() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
}

extension WriteViewController: RankingSelectDelegate {
    
    func userInfo(name: String) {
        showToast(message: "\(name)님을 선택하셨습니다.")
    }
    
}
