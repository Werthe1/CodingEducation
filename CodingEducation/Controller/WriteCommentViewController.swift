//
//  WriteCommentViewController.swift
//  CodingEducation
//
//  Created by hyerikim on 06/01/2019.
//  Copyright © 2019 hyerikim. All rights reserved.
//

import UIKit

class WriteCommentViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var constraintY: NSLayoutConstraint!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    var delegate: CommentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentView.layer.cornerRadius = 10
        okButton.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
        constraintY.constant = 1000
        textView.delegate = self
        textView.clipsToBounds = true
        textView.layer.cornerRadius = 5
    }
    
    @IBAction func okButton(_ sender: Any) {
        delegate?.comment(content: textView.text)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLayoutSubviews() {
        constraintY.constant = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
}

extension WriteCommentViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
      
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "답변을 입력하세요."
            textView.textColor = UIColor.lightGray
        }
    }
    
}
