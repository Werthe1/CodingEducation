//
//  CoalaModel.swift
//  CodingEducation
//
//  Created by hyerikim on 02/01/2019.
//  Copyright © 2019 hyerikim. All rights reserved.
//

import RealmSwift

class CoalaModel: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var descript: String = ""
    @objc dynamic var image: UIImage?
    @objc dynamic var like: Bool = false
    @objc dynamic var createdTime: Date?
}
