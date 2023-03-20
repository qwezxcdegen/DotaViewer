//
//  ProfileModel.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 20.03.2023.
//

import Foundation
import UIKit

struct ProfileElement: Codable {
    let account_id: Int
    let personaname: String
    let avatarfull: String
    let last_match_time: String?
}

typealias Profile = [ProfileElement]
