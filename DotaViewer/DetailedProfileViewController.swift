//
//  DetailedProfileViewController.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 21.03.2023.
//

import UIKit

class DetailedProfileViewController: UIViewController {
    
    @IBOutlet weak var navigationBarLabel: UINavigationItem!
    
    var id = ""
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarLabel.title = name
        print(id)
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
}
