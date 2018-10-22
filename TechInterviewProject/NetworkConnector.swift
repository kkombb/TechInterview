//
//  NetworkConnector.swift
//  TechInterviewProject
//
//  Created by KirtisOrendorff on 10/18/18.
//  Copyright © 2018 KirtisOrendorff. All rights reserved.
//

import UIKit

class NetworkConnector: NSObject {

    static var errorMessage = ""
    static var connectionString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/10/explicit.json"
    
    typealias returnResults = (FetchedData.JsonData) -> ()
    
    static func getResults(completion: @escaping returnResults) {
        let url = URL(string: connectionString)
        let request = URLRequest(url: url!)
        var results = FetchedData.JsonData(feed: nil)
        
        //need to make everything wait for task
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if let data = data {
                results = self.parseJSON(data: data)!
                DispatchQueue.main.async {
                    completion(results)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
        //return results
    }
    
    static func parseJSON(data: Data) -> FetchedData.JsonData?{
        do{
            let decoder = JSONDecoder()
            
            let returnedValues = try decoder.decode(FetchedData.JsonData.self, from: data)
            
            print(returnedValues.feed?.results[0].artistName)
            return returnedValues
        } catch let error{
            print("Error occured: ")
            print(error as? Any)
        }
        return nil
    }
}
