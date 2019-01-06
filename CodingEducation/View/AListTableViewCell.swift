//
//  AListTableViewCell.swift
//  CodingEducation
//
//  Created by hyerikim on 05/01/2019.
//  Copyright © 2019 hyerikim. All rights reserved.
//

import UIKit

class AListTableViewCell: UITableViewCell {

    @IBOutlet weak var mtLabel: UILabel!
    @IBOutlet weak var myView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
