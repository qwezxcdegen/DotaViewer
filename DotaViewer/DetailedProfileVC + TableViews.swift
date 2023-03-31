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
            
        // Played With
        } else if tableView == playedWithTableView {
            return players.count
            
        // Else
        } else {
            return 0
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
            if matches[indexPath.row].didWin {
                cell.heroNameLabel.textColor = .systemGreen
            } else {
                cell.heroNameLabel.textColor = .systemRed
            }
            
            return cell
            
        // Played With
        } else if tableView == playedWithTableView {
            let cell = playedWithTableView.dequeueReusableCell(withIdentifier: "playedWith", for: indexPath) as! PlayedWithTableViewCell
            
            cell.gamesLabel.text = String(players[indexPath.row].games)
            cell.winsLabel.text = String(players[indexPath.row].win)
            cell.nicknameLabel.text = players[indexPath.row].personaname
            cell.avatarImage.load(url: URL(string: players[indexPath.row].avatarfull)!)
            
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
            
        // Played with
        } else if tableView == playedWithTableView {
            return "Played with"
            
        // Else
        } else {
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == playedWithTableView {
            self.profileID = String(players[indexPath.row].account_id)
            self.profileName = players[indexPath.row].personaname
            self.profileImageString = players[indexPath.row].avatarfull
            heroes = []
            matches = []
            players = []
            self.viewDidLoad()
            playedWithTableView.reloadData()
            recentMatchesTableView.reloadData()
            featuredHeroesTableView.reloadData()
        }
    }
    
}
