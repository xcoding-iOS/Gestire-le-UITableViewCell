//
//  Match.swift
//  Managing UITableViewCell
//
//  Created by Giuseppe Sapienza on 18/05/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import UIKit

struct Match {
    let home: Team
    let out: Team

    let stadium: String
    let date: String

    let live: MatchLiveStats?
}

struct Team {
    var name: String
    var image: UIImage
}

struct MatchLiveStats {
    let homeGoal: Int
    let outGoal: Int
}
