//
//  Protocol.swift
//  CodingEducation
//
//  Created by hyerikim on 31/12/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import Foundation

protocol NaviSetting {
    func defaultNavi()
}

protocol RankingSelectDelegate {
    func userInfo(name: String)
}

protocol CommentDelegate {
    func comment(content: String)
}
