//
//  DetailedProfileVC + FeaturedHeroesTV.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 21.03.2023.
//

import Foundation
import UIKit

extension DetailedProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = featuredHeroesTableView.dequeueReusableCell(withIdentifier: "featuredHero", for: indexPath) as! FeaturedHeroTableViewCell
        let winRate = Double(heroes[indexPath.row].win) / Double(heroes[indexPath.row].games) * 100
        
        cell.heroNameLabel.text = heroes[indexPath.row].heroName
        cell.totalGamesLabel.text = String(heroes[indexPath.row].games)
        cell.totalWinsLabel.text = String(heroes[indexPath.row].win)
        cell.winRateLabel.text = String(format: "%.1f%%", winRate)
        cell.winRateLabel.textColor = winRate > 50 ? .systemGreen : .systemRed
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Featured heroes"
    }
    
    
}
