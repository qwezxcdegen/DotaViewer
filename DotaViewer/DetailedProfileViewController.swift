//
//  DetailedProfileViewController.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 21.03.2023.
//

import UIKit

class DetailedProfileViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var featuredHeroesTableView: UITableView!
    @IBOutlet weak var navigationBarLabel: UINavigationItem!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var losesLabel: UILabel!
    @IBOutlet weak var wlPercentageLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    private var wlPercentageInt: Double {
        100 * (Double(winsLabel.text!)! / (Double(winsLabel.text!)! + Double(losesLabel.text!)!))
    }
    private var wlPercentageString: String {
        String(format: "%.2f%%", 100 * (Double(winsLabel.text!)! / (Double(winsLabel.text!)! + Double(losesLabel.text!)!)))
    }
    
    var profileID = ""
    var profileName = ""
    var profileImageString = ""
    
    // MARK: - Arrays for tableViews
    // Featured heroes
    var heroes: Heroes = []
    
    // Last games
    // var recentGames
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.featuredHeroesTableView.delegate = self
        self.featuredHeroesTableView.dataSource = self
        
        navigationBarLabel.title = profileName
        
        fetchWinLoses()
        
        fetchFeaturedHeroes()
        
        profileImage.load(url: URL(string: profileImageString)!)
        
        print(profileID)
        
    }
    
    //MARK: - Actions
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    
    
    
    // MARK: - func FetchWinLoses
    private func fetchWinLoses() {
        guard profileID != "" else { return }
        let urlString = "https://api.opendota.com/api/players/\(profileID)/wl".encodeUrl
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            guard error == nil else { return }
            let winLoses = try? JSONDecoder().decode(WinLoseModel.self, from: data)
            guard let winLoses else { return }
            DispatchQueue.main.async {
                self.winsLabel.text = String(winLoses.win)
                self.losesLabel.text = String(winLoses.lose)
                self.wlPercentageLabel.text = self.wlPercentageString
                self.wlPercentageLabel.textColor = self.wlPercentageInt > 50
                ? .systemGreen
                : .systemRed
            }
        }.resume()
    }
    
    // MARK: - func fetchFeaturedHeroes
    private func fetchFeaturedHeroes() {
        guard profileID != "" else { return }
        let urlString = "https://api.opendota.com/api/players/\(profileID)/heroes".encodeUrl
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            guard error == nil else { return }
            let featuredHeroes = try? JSONDecoder().decode(Heroes.self, from: data)
            guard let featuredHeroes else { return }
            DispatchQueue.main.async {
                for i in 0...4 {
                    self.heroes.append(featuredHeroes[i])
                }
                self.featuredHeroesTableView.reloadData()
            }
        }.resume()
    }
    
}
