//
//  WriteView.swift
//  CodingEducation
//
//  Created by hyerikim on 01/01/2019.
//  Copyright © 2019 hyerikim. All rights reserved.
//

import UIKit

extension WriteViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func createImagePicker() {
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
