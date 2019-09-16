//
//  ChatterTableViewController.swift
//  441StarterApp
//
//  Created by Alec Goldberg on 9/13/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit

class Chatt {
    var username: String
    var timestamp: String
    var message: String
    
    public init(user: String, time: String, message: String) {
        self.username = user
        self.timestamp = time
        self.message = message
    }
}

class ChatterTableViewController: UITableViewController {

    var chatts: [Chatt] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.refreshControl?.tintColor = UIColor.purple.withAlphaComponent(0.35)
        self.refreshControl?.beginRefreshing()
        self.handleRefresh()
        

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
        tableView.register(ChatterTableViewCell.self, forCellReuseIdentifier: "ChatterCell")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chatts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatterCell", for: indexPath) as? ChatterTableViewCell else {
            return UITableViewCell()
        }

        cell.selectionStyle = .none
        cell.user.text = chatts[indexPath.row].username
        cell.message.text = chatts[indexPath.row].message
        cell.timestamp.text = chatts[indexPath.row].timestamp

        return cell
    }
}

extension ChatterTableViewController {
    
    @objc func handleRefresh() {
        self.refreshChatts()
        self.refreshControl?.endRefreshing()
    }
    
    func refreshChatts() {
        
        guard let endpointURL = URL(string: "http://134.209.218.243/getchatts/") else {
            return
        }
        
        var request = URLRequest(url: endpointURL)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let _ = data, error == nil else {
                print("GET NETWORKING ERROR")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                
                print("HTTP STATUS: \(httpStatus.statusCode)")
                return
                
            }
            
            do {
                
                var newChatts = [Chatt]()
                if let json = try JSONSerialization.jsonObject(with: data!) as? [String:Any] {
                    DispatchQueue.main.async {
                        let chattsReceived = json["chatts"] as? [[String]] ?? []
                        
                        for chattEntry in chattsReceived {
                            let chatt = Chatt(user: chattEntry[0], time: chattEntry[2], message: chattEntry[1])
                            newChatts += [chatt]
                        }
                        
                        self.chatts = newChatts
                        self.tableView.reloadData()
                    }
                }
            }
            catch let error as NSError {
                print(error)
            }
        }
        task.resume()
    }
}
