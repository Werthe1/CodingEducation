//
//  EditTableViewCell.swift
//  CodingEducation
//
//  Created by hyerikim on 07/01/2019.
//  Copyright © 2019 hyerikim. All rights reserved.
//

import UIKit

class EditTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myView.layer.cornerRadius = 5
        textView.delegate = self
        textView.text = "답변을 입력하세요."
        textView.textColor = UIColor.lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if let color = textView.textColor {
            if color == UIColor.lightGray {
                textView.text = nil
                textView.textColor = UIColor.black
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "답변을 입력하세요."
            textView.textColor = UIColor.lightGray
        }
    }
}
