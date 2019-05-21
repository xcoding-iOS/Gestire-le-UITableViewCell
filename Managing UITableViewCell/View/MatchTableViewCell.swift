//
//  MatchTableViewCell.swift
//  Managing UITableViewCell
//
//  Created by Giuseppe Sapienza on 18/05/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var matchView: UIView!
    @IBOutlet weak var liveButton: UIButton!
    
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var homeNameLabel: UILabel!
    @IBOutlet weak var homeResultStack: UIStackView!
    @IBOutlet weak var homeGoalLabel: UILabel!
    
    @IBOutlet weak var outImageView: UIImageView!
    @IBOutlet weak var outNameLabel: UILabel!
    @IBOutlet weak var outResultStack: UIStackView!
    @IBOutlet weak var outGoalLabel: UILabel!
    
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.matchView.layer.cornerRadius = 6
        self.liveButton.layer.cornerRadius = 6
    }

}
