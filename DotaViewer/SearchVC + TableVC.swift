//
//  SearchVC + TableVC.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 20.03.2023.
//

import Foundation
import UIKit

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
        cell.profileNameLabel.text = profiles[indexPath.row].personaname
        cell.profileIDLabel.text = String(profiles[indexPath.row].account_id)
        if let lastMatch = profiles[indexPath.row].last_match_time {
            cell.profileLastMatchLabel.text = String(lastMatch.split(separator: "T")[0])
        } else {
            cell.profileLastMatchLabel.text = "-"
        }
        let url = URL(string: profiles[indexPath.row].avatarfull)!
        cell.profileImage.load(url: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailedSegue", sender: nil)
    }
    
}
