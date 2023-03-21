//
//  ViewController.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 20.03.2023.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var profiles: Profile = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navVC = segue.destination as! UINavigationController
        let detailedVC = navVC.viewControllers.first as! DetailedProfileViewController
        let indexPath = tableView.indexPathForSelectedRow!
        
        detailedVC.profileID = String(profiles[indexPath.row].account_id)
        detailedVC.profileName = profiles[indexPath.row].personaname
        detailedVC.profileImageString = profiles[indexPath.row].avatarfull
        
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        self.activityIndicatorView.startAnimating()
        fetchProfiles()
        view.endEditing(true)
    }
    
    private func fetchProfiles() {
        guard textField.text != nil else { return }
        let urlString = "https://api.opendota.com/api/search?q=\(textField.text!)".encodeUrl
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            guard error == nil else { return }
            let profilesData = try? JSONDecoder().decode(Profile.self, from: data)
            guard let profilesData else { return }
            DispatchQueue.main.async {
                self.profiles = []
                for profile in profilesData {
                    self.profiles.append(profile)
                }
                print(self.profiles)
                self.tableView.reloadData()
                self.activityIndicatorView.stopAnimating()
            }
        }.resume()
    }
}

