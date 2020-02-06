//
//  GitHubClient.swift
//  Github_Issue
//
//  Created by sinze vivens on 2020/1/26.
//  Copyright © 2020 Luke. All rights reserved.
//

// Attribute: session3.playground from lecture

import Foundation

struct GitHubIssue : Codable{
    let title: String?
    let createdAt: String
    let body: String?
    let state: String
    let user: GitHubUser
}

struct GitHubUser: Codable{
    let login: String
}

class GitHubClient{
    static func fetchReleases(isOpen:Bool,completion: @escaping ([GitHubIssue]?, Error?) -> Void) {
        
        var url = URL(string: "https://api.github.com/repos/dustinblackman/Championify/issues?state=open")!
        if isOpen == false {
            url = URL(string: "https://api.github.com/repos/dustinblackman/Championify/issues?state=closed")!
        }
        //let url = URL(string: //"https://api.github.com/repos/dustinblackman/Championify/issues?state=closed")!

        let task = URLSession.shared.dataTask(with: url, completionHandler:  { data, _, error in

            guard let data = data, error == nil else {
                DispatchQueue.main.async { completion(nil, error) }
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let releases = try decoder.decode([GitHubIssue].self, from: data)
                DispatchQueue.main.async { completion(releases, nil) }
            } catch (let parsingError) {
                DispatchQueue.main.async { completion(nil, parsingError) }
                completion(nil, parsingError)
            }
        })
        //start the task
        task.resume()
        
    }
}

