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
        // Featured Heroes
        if tableView == featuredHeroesTableView {
            return heroes.count
            
        // Recent Matches
        } else if tableView == recentMatchesTableView {
            return matches.count
            
        // Else
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Featured Heroes
        if tableView == featuredHeroesTableView {
            let cell = featuredHeroesTableView.dequeueReusableCell(withIdentifier: "featuredHero", for: indexPath) as! FeaturedHeroTableViewCell
            let winRate = Double(heroes[indexPath.row].win) / Double(heroes[indexPath.row].games) * 100
            
            cell.heroNameLabel.text = heroes[indexPath.row].heroName
            cell.totalGamesLabel.text = String(heroes[indexPath.row].games)
            cell.totalWinsLabel.text = String(heroes[indexPath.row].win)
            cell.winRateLabel.text = String(format: "%.1f%%", winRate)
            cell.winRateLabel.textColor = winRate > 50 ? .systemGreen : .systemRed
            
            return cell
            
        // Recent Matches
        } else if tableView == recentMatchesTableView {
            let cell = recentMatchesTableView.dequeueReusableCell(withIdentifier: "recentMatch", for: indexPath) as! RecentMatchTableViewCell
            
            cell.killsProgress.progress = Float(matches[indexPath.row].kda.0)
            cell.deathsProgress.progress = Float(matches[indexPath.row].kda.1)
            cell.heroNameLabel.text = matches[indexPath.row].heroName
            cell.durationLabel.text = matches[indexPath.row].matchDuration
            cell.gamemodeLabel.text = matches[indexPath.row].gameMode
            cell.killsCountLabel.text = String(matches[indexPath.row].kills)
            cell.assistantsCountLabel.text = String(matches[indexPath.row].assists)
            cell.deathsCountLabel.text = String(matches[indexPath.row].deaths)
            cell.howManyTimeAgoLabel.text = timeSince(seconds: matches[indexPath.row].start_time)
            
            return cell
            
        // Else
        } else {
            return UITableViewCell.init()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Featured Heroes
        if tableView == featuredHeroesTableView {
            return "Featured heroes"
            
        // Recent Matches
        } else if tableView == recentMatchesTableView {
            return "Recent matches"
            
        // Else
        } else {
            return ""
        }
    }
    
    
}
