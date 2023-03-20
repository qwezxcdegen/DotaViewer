//
//  ProfileModel.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 20.03.2023.
//

import Foundation

struct ProfileElement: Codable {
    let personaname: String
}

typealias Profile = [ProfileElement]
