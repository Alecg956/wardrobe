//
//  BrowseTableViewController.swift
//  wardrobe
//
//  Created by Alec Goldberg on 10/31/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit
import FirebaseDatabase



class BrowseTableViewController: UITableViewController {
    
    var categories: [String] = []
    var sectionTitles: [String] = ["Categories"]
    
    func getCategories() {
        categories = ["Shirts", "Pants"]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference()



        ref.child("Shirts/Buttom Up Shirt/itemName").setValue("Buttom_Up_Shirt")
        ref.child("Shirts/Buttom Up Shirt/imageName").setValue("buttom_up_shirt")
        ref.child("Buttoms/Chinos/itemName").setValue("Chinos")
        ref.child("Buttoms/Chinos/imageName").setValue("chinos")
        ref.child("Footwear/Sneakers/itemName").setValue("Sneakers")
        ref.child("Footwear/Sneakers/imageName").setValue("sneakers")
        ref.child("Accessories/Cap/itemName").setValue("Cap")
        ref.child("Accessories/Cap/imageName").setValue("cap")
        ref.child("Dresses/Dress/itemName").setValue("Dress")
        ref.child("Dresses/Dress/imageName").setValue("dress")

        
        tableView.register(BrowseTableViewCell.self, forCellReuseIdentifier: BrowseTableViewCell.reuseIdentifier)
        self.clearsSelectionOnViewWillAppear = false
        
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
        
        self.present(newVC, animated: true)
    }
}
