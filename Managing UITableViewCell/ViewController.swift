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
        cell.match = match
        return cell
    }
}

