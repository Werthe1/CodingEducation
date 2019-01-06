//
//  EmptyTableViewCell.swift
//  CodingEducation
//
//  Created by hyerikim on 07/01/2019.
//  Copyright © 2019 hyerikim. All rights reserved.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    @IBOutlet weak var myView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myView.clipsToBounds = true
        myView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
