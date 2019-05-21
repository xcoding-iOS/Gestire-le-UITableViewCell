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
    
    var match: Match? {
        didSet {
            self.homeNameLabel.text = match?.home.name
            self.homeImageView.image = match?.home.image
            
            self.outNameLabel.text = match?.out.name
            self.outImageView.image = match?.out.image
            
            self.dateLabel.text = match?.date
            self.stadiumLabel.text = match?.stadium
            
            if let live = match?.live {
                self.liveButton.isHidden = false
                self.homeResultStack.isHidden = false
                self.outResultStack.isHidden = false
                self.homeGoalLabel.text = "\(live.homeGoal)"
                self.outGoalLabel.text = "\(live.outGoal)"
                
                if (live.homeGoal > live.outGoal) {
                    self.homeGoalLabel.textColor = #colorLiteral(red: 0.9267585874, green: 0.367726624, blue: 0.3804723024, alpha: 1)
                    self.outGoalLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                } else if (live.homeGoal < live.outGoal) {
                    self.homeGoalLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                    self.outGoalLabel.textColor = #colorLiteral(red: 0.9267585874, green: 0.367726624, blue: 0.3804723024, alpha: 1)
                }
                
            } else {
                self.liveButton.isHidden = true
                self.homeResultStack.isHidden = true
                self.outResultStack.isHidden = true
            }
        }
    }
    
    @IBAction func shareButton_clicked(_ sender: UIButton) {
        print("Share...")
        print("Home: \(self.match!.home) - Out: \(self.match!.out)")
        /* Il codice per lo share */
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.matchView.layer.cornerRadius = 6
        self.liveButton.layer.cornerRadius = 6
    }

}
