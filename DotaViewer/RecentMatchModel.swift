//
//  RecentMatchModel.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 21.03.2023.
//

import Foundation

struct RecentMatch: Codable {
    let player_slot: Int
    let radiant_win: Bool
    let duration: Int
    let start_time: Int
    let game_mode: Int
    let hero_id: Int
    let kills, deaths, assists: Int
    let xp_per_min: Int
    let gold_per_min: Int
    let hero_damage: Int
    let tower_damage: Int
    let hero_healing: Int
    let last_hits: Int
}

typealias RecentMatches = [RecentMatch]

extension RecentMatch {
    var gameMode: String {
        fromIDToGameMode(ID: game_mode)
    }
    var playerSide: String {
        fromIDToSide(ID: player_slot)
    }
    var didWin: Bool {
        playerSide == "Radiant" && radiant_win
    }
    var matchDuration: String {
        secondsFormatter(seconds: Double(duration))
    }
    var kda: (Double, Double) {
        let sum = kills + deaths + assists
        return (Double(kills) / Double(sum), Double(deaths) / Double(sum))
    }
    var heroName: String {
        fromIDToHero(heroID: String(hero_id))
    }
    
}
