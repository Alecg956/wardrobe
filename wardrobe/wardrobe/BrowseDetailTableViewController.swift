//
//  BrowseTableViewController.swift
//  wardrobe
//
//  Created by Alec Goldberg on 10/31/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit

class BrowseDetailTableViewController: UITableViewController {
    
    var pageTitle: String = ""
    var pageItems: [pageItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BrowseDetailTableViewCell.self, forCellReuseIdentifier: BrowseDetailTableViewCell.reuseIdentifier)
        self.clearsSelectionOnViewWillAppear = true
        
        getItems()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pageItems.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return pageTitle
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BrowseDetailTableViewCell.reuseIdentifier, for: indexPath) as? BrowseDetailTableViewCell else {
            
            return UITableViewCell()
            
        }
            
        cell.itemLabel.text = pageItems[indexPath.row].itemName
        cell.itemImageView.image = UIImage(named: pageItems[indexPath.row].imageName)  
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Global.selectedItem = pageItems[indexPath.row].itemName
        
        print(Global.selectedItem)
        self.tabBarController?.selectedIndex = 2
    }
    
    func getItems() {
        
        // call database here
        if (pageTitle == "Shirts") {
            pageItems.append(pageItem(itemName: "White_Shirt", imageName: "white_shirt"))
        } else if (pageTitle == "Pants") {
            pageItems.append(pageItem(itemName: "Blue_Pants", imageName: "blue_pants"))
        }
    }
}

struct pageItem {
    var itemName: String = ""
    var imageName: String = ""
}
