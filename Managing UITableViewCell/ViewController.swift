//
//  ViewController.swift
//  Managing UITableViewCell
//
//  Created by Giuseppe Sapienza on 18/05/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var matchs: [Match] = [
        Match.init(
            home: Team.init(name: "Juventus", image: #imageLiteral(resourceName: "Juve")),
            out: Team.init(name: "Milan", image: #imageLiteral(resourceName: "Milan")),
            stadium: "Juventus Stadium",
            date: "18/03/2099 alle 21:00",
            live: MatchLiveStats.init(homeGoal: 2, outGoal: 1)
        ),
        Match.init(
            home: Team.init(name: "Napoli", image: #imageLiteral(resourceName: "Napoli")),
            out: Team.init(name: "Roma", image: #imageLiteral(resourceName: "Roma")),
            stadium: "San Paolo",
            date: "18/03/2099 alle 20:30",
            live: MatchLiveStats.init(homeGoal: 3, outGoal: 4)
        ),
        Match.init(
            home: Team.init(name: "Inter", image: #imageLiteral(resourceName: "Inter")),
            out: Team.init(name: "Fiorentina", image: #imageLiteral(resourceName: "Fiorentina")),
            stadium: "San Siro",
            date: "19/03/2099 alle 15:30",
            live: nil
        )
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
    }

}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matchs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let match = self.matchs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as! MatchTableViewCell
        cell.homeNameLabel.text = match.home.name
        cell.homeImageView.image = match.home.image
        
        cell.outNameLabel.text = match.out.name
        cell.outImageView.image = match.out.image
        
        cell.dateLabel.text = match.date
        cell.stadiumLabel.text = match.stadium
        
        if let live = match.live {
            cell.liveButton.isHidden = false
            cell.homeResultStack.isHidden = false
            cell.outResultStack.isHidden = false
            cell.homeGoalLabel.text = "\(live.homeGoal)"
            cell.outGoalLabel.text = "\(live.outGoal)"
            
            if (live.homeGoal > live.outGoal) {
                cell.homeGoalLabel.textColor = #colorLiteral(red: 0.9267585874, green: 0.367726624, blue: 0.3804723024, alpha: 1)
                cell.outGoalLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            } else if (live.homeGoal < live.outGoal) {
                cell.homeGoalLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.outGoalLabel.textColor = #colorLiteral(red: 0.9267585874, green: 0.367726624, blue: 0.3804723024, alpha: 1)
            }
            
        } else {
            cell.liveButton.isHidden = true
            cell.homeResultStack.isHidden = true
            cell.outResultStack.isHidden = true
        }
        return cell
    }
}

