//
//  BrowseTableViewController.swift
//  wardrobe
//
//  Created by Alec Goldberg on 10/31/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit



class BrowseTableViewController: UITableViewController {
    
    var categories: [String] = []
    var sectionTitles: [String] = ["Categories"]
    var gender: Gender = .other
    
    func getCategories() {
        
        switch Global.gender {
        case .male:
            categories = ["Shirts", "Jackets", "Bottoms", "Footwear", "Accessories"]
        case .female:
            categories = ["Shirts", "Jackets", "Bottoms", "Dresses", "Footwear", "Accessories"]
        case .other:
            categories = ["Shirts", "Jackets", "Bottoms", "Footwear", "Accessories"]
        }
        
        if Global.gender != gender {
            tableView.reloadData()
        }
        
        gender = Global.gender
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BrowseTableViewCell.self, forCellReuseIdentifier: BrowseTableViewCell.reuseIdentifier)
        self.clearsSelectionOnViewWillAppear = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getCategories()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BrowseTableViewCell.reuseIdentifier, for: indexPath) as? BrowseTableViewCell else {
            
            return UITableViewCell()
            
        }
            
        cell.categoryLabel.text = categories[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let newVC = BrowseDetailTableViewController()
        newVC.pageTitle = categories[indexPath.row]
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}
