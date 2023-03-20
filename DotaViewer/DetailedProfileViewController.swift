//
//  DetailedProfileViewController.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 21.03.2023.
//

import UIKit

class DetailedProfileViewController: UIViewController {
    
    @IBOutlet weak var navigationBarLabel: UINavigationItem!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var losesLabel: UILabel!
    
    @IBOutlet weak var wlPercentageLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    var wlPercentageInt: Double {
        100 * (Double(winsLabel.text!)! / (Double(winsLabel.text!)! + Double(losesLabel.text!)!))
    }
    var wlPercentageString: String {
        String(format: "%.2f%%", 100 * (Double(winsLabel.text!)! / (Double(winsLabel.text!)! + Double(losesLabel.text!)!)))
    }
    
    
    var profileID = ""
    var profileName = ""
    var profileImageString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDetailedProfile()
        navigationBarLabel.title = profileName
        profileImage.load(url: URL(string: profileImageString)!)
        print(profileID)
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    private func fetchDetailedProfile() {
        guard profileID != "" else { return }
        let urlString = "https://api.opendota.com/api/players/\(profileID)/wl".encodeUrl
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            guard error == nil else { return }
            let detailedProfile = try? JSONDecoder().decode(DetailedProfile.self, from: data)
            guard let detailedProfile else { return }
            DispatchQueue.main.async {
                self.winsLabel.text = String(detailedProfile.win)
                self.losesLabel.text = String(detailedProfile.lose)
                self.wlPercentageLabel.text = self.wlPercentageString
                self.wlPercentageLabel.textColor = self.wlPercentageInt > 50
                ? .systemGreen
                : .systemRed
            }
        }.resume()
    }
    
}
