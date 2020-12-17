//
//  DashboardVC.swift
//  MedTools
//
//  Created by Ariel on 18/12/20.
//

import UIKit
import ImageSlideshow

protocol DashboardDisplayLogic: class {
    func tooslResult(completion: Result<Dashboard.ViewModel, Error>)
}

class DashboardVC: UIViewController, DashboardDisplayLogic {
    
    @IBOutlet weak var toolsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tooslResult(completion: Result<Dashboard.ViewModel, Error>) {
        
    }
}

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }
}
