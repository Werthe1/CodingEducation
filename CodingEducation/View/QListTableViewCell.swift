//
//  QListTableViewCell.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

class QListTableViewCell: UITableViewCell {
    
    private var toggle = false
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        myView.layer.cornerRadius = 10
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func likeButton(_ sender: UIButton) {
        toggle ? sender.setImage(UIImage(named: "unlike"), for: .normal) :             sender.setImage(UIImage.init(named: "like"), for: .normal)
        toggle = !toggle
    }
    
}
