//
//  ViewController.swift
//  TechInterviewProject
//
//  Created by KirtisOrendorff on 10/17/18.
//  Copyright © 2018 KirtisOrendorff. All rights reserved.
//

//Feed URL: https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/10/explicit.json

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var artistLabel: UILabel!
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //connection variables
    var data = FetchedData.JsonData(feed: nil)
    
    //functioning variables
    var connectionString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/10/explicit.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        activityIndicator.startAnimating()
        NetworkConnector.getResults { (JsonData) in
            self.data = JsonData
            self.tableView.reloadData()
            
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.feed?.results.count ?? 0
        //return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath)
        
        if let cell = cell as? AlbumInfoTableCell {
            let result = data.feed?.results[indexPath.row]
            
            cell.albumLabel.text = result?.name
            cell.artistLabel.text = result?.artistName
            cell.albumImage = nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

