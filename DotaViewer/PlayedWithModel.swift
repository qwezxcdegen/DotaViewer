//
//  PlayedWithModel.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 22.03.2023.
//

import Foundation

struct Peer: Codable {
    let games: Int
    let win: Int
    let personaname: String
    let avatarfull: String
}

typealias Peers = [Peer]
