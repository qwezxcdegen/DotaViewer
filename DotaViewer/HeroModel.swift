//
//  HeroModel.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 21.03.2023.
//

import Foundation

struct Hero: Codable {
    let hero_id: String
    let games: Int
    let win: Int
}

typealias Heroes = [Hero]


extension Hero {
    var heroName: String {
        fromIDToHero(heroID: hero_id)
    }
}
