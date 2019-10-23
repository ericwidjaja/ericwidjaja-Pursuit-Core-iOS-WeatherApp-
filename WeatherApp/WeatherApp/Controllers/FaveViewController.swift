//
//  FaveViewController.swift
//  WeatherApp
//
//  Created by Eric Widjaja on 10/12/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class FaveViewController: UIViewController {
    
    var favorites = [FavePict]() {
        didSet {
            faveTableView.reloadData()
        }
    }
    
    @IBOutlet weak var faveTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
}

extension FaveViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = faveTableView.dequeueReusableCell(withIdentifier: "faveCell", for: indexPath) as! FavoTableViewCell
        let fav = favorites[indexPath.row]
        cell.cityLabel.text = fav.name
        cell.cityImage.image = UIImage(data: fav.image)
        cell.delegate = self as! FavDelegate
        return cell
    }
}
