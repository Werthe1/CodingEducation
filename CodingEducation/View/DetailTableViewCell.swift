//
//  DetailTableViewCell.swift
//  CodingEducation
//
//  Created by hyerikim on 04/01/2019.
//  Copyright © 2019 hyerikim. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var codeVIew: UIView!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var qImageView: UIImageView!
    @IBOutlet weak var wImageView: UIImageView!
    @IBOutlet weak var eImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        codeVIew.layer.cornerRadius = 5
        myView.layer.cornerRadius = 5
        codeLabel.text = """
        public interface Calculator {
            default int multiple(int i, int j) {
                return i * j;
            }
        }
        """
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
