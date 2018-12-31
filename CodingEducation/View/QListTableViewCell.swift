//
//  QListTableViewCell.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

class QListTableViewCell: UITableViewCell {
    
    var toggle = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func likeButton(_ sender: UIButton) {
        if toggle {
            sender.setImage(UIImage(named: "unlike"), for: .normal)
        } else {
            sender.setImage(UIImage.init(named: "like"), for: .normal)
        }
        toggle = !toggle
    }
    
}
