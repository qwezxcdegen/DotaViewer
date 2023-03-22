//
//  DetailedProfileViewController.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 21.03.2023.
//

import UIKit

class DetailedProfileViewController: UIViewController {
    
    // MARK: - Properties
    // Featured Heroes TV
    @IBOutlet weak var featuredHeroesTableView: UITableView!
    
    // Recent Matches TV
    @IBOutlet weak var recentMatchesTableView: UITableView!
    
    // Played With TV
    @IBOutlet weak var playedWithTableView: UITableView!
    
    
    // Nav bar
    @IBOutlet weak var navigationBarLabel: UINavigationItem!
    
    // Labels
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
    
    // Recent matches
    var matches: RecentMatches = []
    
    // Players
    var players: Peers = []
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViews()
        
        navigationBarLabel.title = profileName
        
        fetchWinLoses()
        
        fetchFeaturedHeroes()
        
        fetchRecentMatches()
        
        fetchPlayers()
        
        profileImage.load(url: URL(string: profileImageString)!)
        
        print(profileID)
        
    }
    
    //MARK: - Actions
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    // MARK: - Fetch Wins Loses
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
    
    // MARK: - Fetch Featured Heroes
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
    
    // MARK: - Fetch Recent Matches
    private func fetchRecentMatches() {
        guard profileID != "" else { return }
        let urlString = "https://api.opendota.com/api/players/\(profileID)/recentMatches"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            guard error == nil else { return }
            let recentMatches = try? JSONDecoder().decode(RecentMatches.self, from: data)
            guard let recentMatches else { return }
            DispatchQueue.main.async {
                if recentMatches.count > 5 {
                    for i in 0...4 {
                        self.matches.append(recentMatches[i])
                    }
                } else {
                    for match in recentMatches {
                        self.matches.append(match)
                    }
                }
                self.recentMatchesTableView.reloadData()
            }
        }.resume()
    }
    
    // MARK: - Fetch Players
    private func fetchPlayers() {
        guard profileID != "" else { return }
        let urlString = "https://api.opendota.com/api/players/\(profileID)/peers"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            guard error == nil else { return }
            let playedWith = try? JSONDecoder().decode(Peers.self, from: data)
            guard let playedWith else { return }
            DispatchQueue.main.async {
                if playedWith.count > 5 {
                    for i in 0...4 {
                        self.players.append(playedWith[i])
                    }
                } else {
                    for player in playedWith {
                        self.players.append(player)
                    }
                }
                self.playedWithTableView.reloadData()
            }
        }.resume()
    }
    
    // MARK: - Setup Table Views
    private func setupTableViews() {
        self.featuredHeroesTableView.delegate = self
        self.featuredHeroesTableView.dataSource = self
        self.recentMatchesTableView.delegate = self
        self.recentMatchesTableView.dataSource = self
        self.playedWithTableView.delegate = self
        self.playedWithTableView.dataSource = self
    }
}
