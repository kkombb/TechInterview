//
//  FetchedData.swift
//  TechInterviewProject
//
//  Created by KirtisOrendorff on 10/18/18.
//  Copyright © 2018 KirtisOrendorff. All rights reserved.
//

import UIKit

class FetchedData: NSObject {
    
    struct JsonData: Decodable{
        private enum CodingKeys : String, CodingKey {
            case feed = "feed"
        }
        let feed: Feed?
    }
    struct Feed: Decodable{
        private enum CodingKeys : String, CodingKey {
            case results = "results"
        }
        let results: [Results]
    }
    struct Results: Decodable{
        private enum CodingKeys : String, CodingKey{
            case name = "name"
            case artistName = "artistName"
            case url = "url"
            case artworkUrl100 = "artworkUrl100"
        }
        
        let name: String
        let artistName: String
        let url: String
        let artworkUrl100: String
    }
}
