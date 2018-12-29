//
//  ViewController.swift
//  StashChallenge
//
//  Created by Felix Changoo on 12/27/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import UIKit

class AchievementVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: AchievementsPresenterProtocol?
    
    var achievements: [Achievement] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.dataSource = self
    }
}

extension AchievementVC: AchievementsViewProtocol {
    func updateView(with result: AchievementResult) {
        self.navigationItem.title = result.titleInfo.title
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 106/255, green:  55/255, blue: 212/255, alpha: 1)
        self.achievements = result.achievements
    }
}

extension AchievementVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AchievementCell else {
            fatalError("Cell not found!")
        }
        
        let achievement = achievements[indexPath.row]
        cell.configure(achievement: achievement)
        
        return cell
    }
}

