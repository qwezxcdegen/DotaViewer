//
//  RecentMatchTableViewCell.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 21.03.2023.
//

import UIKit

class RecentMatchTableViewCell: UITableViewCell {
    @IBOutlet weak var killsProgress: UIProgressView!
    @IBOutlet weak var deathsProgress: UIProgressView!
    
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var gamemodeLabel: UILabel!
    @IBOutlet weak var howManyTimeAgoLabel: UILabel!
    @IBOutlet weak var killsCountLabel: UILabel!
    @IBOutlet weak var assistantsCountLabel: UILabel!
    @IBOutlet weak var deathsCountLabel: UILabel!
}
