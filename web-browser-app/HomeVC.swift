//
//  HomeViewController.swift
//  web-browser-app
//
//  Created by Sanam Gurung on 8/17/24.
//

import UIKit

class HomeVC: UIViewController {
    var allSites = ["apple.com", "hackingwithswift.com","facebook.com"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
}


extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "urlCell", for: indexPath)
        cell.textLabel?.text = allSites[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "web_view") as? WebVC{
            vc.selectedSite = allSites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
