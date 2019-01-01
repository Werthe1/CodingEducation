//
//  WriteViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultNavi()
    }
    
    @IBAction func imageTapped(_ sender: Any) {
        let imageController = UIImagePickerController()
        imageController.sourceType = .photoLibrary
        imageController.delegate = self
        present(imageController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            if imageView1.image == nil {
                imageView1.image = image
            } else if imageView1.image != nil {
                imageView2.image = image
            } else if imageView2.image != nil {
                imageView3.image = image
            }
        }
        dismiss(animated: true, completion: nil)
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
        self.performSegue(withIdentifier: "Save", sender: self)
    }
}
