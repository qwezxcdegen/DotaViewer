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
        return cell
    }
    
    
}
