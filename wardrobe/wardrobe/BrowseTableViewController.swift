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
        
        ref.child("Shirts").setValue("Black Tshirt")
        ref.child("Shirts").setValue("New Shirt")
        ref.child("Shirts").removeValue()
        
        
        ref.child("Pants/Sweatpants").setValue("red")
        ref.child("Pants/Sweatpants").setValue("blue")
        ref.child("Pants/Sweatpants").setValue("black")
        ref.child("Pants/Long pants").setValue("red")
        ref.child("Pants/Long pants").setValue("blue")
        ref.child("Pants/Long pants").setValue("black")

        
        ref.child("Shirts/Sweatshirt").setValue("red")
        ref.child("Shirts/Sweatshirt").setValue("blue")
        ref.child("Shirts/Sweatshirt").setValue("black")
        ref.child("Shirts/Basic Tee").setValue("red")
        ref.child("Shirts/Basic Tee").setValue("blue")
        ref.child("Shirts/Basic Tee").setValue("black")


        ref.child("Shirts/Green Shirt/itemName").setValue("Green_Shirt")
        ref.child("Shirts/Green Shirt/imageName").setValue("green_shirt")
        ref.child("Shirts/Red Shirt/itemName").setValue("Red_Shirt")
        ref.child("Shirts/Red Shirt/imageName").setValue("red_shirt")
        ref.child("Shirts/Blue Shirt/itemName").setValue("Blue_Shirt")
        ref.child("Shirts/Blue Shirt/imageName").setValue("blue_shirt")
        ref.child("Shirts/Yellow Shirt/itemName").setValue("Yellow_Shirt")
        ref.child("Shirts/Yellow Shirt/imageName").setValue("yellow_shirt")
        ref.child("Shirts/Pink Shirt/itemName").setValue("Pink_Shirt")
        ref.child("Shirts/Pink Shirt/imageName").setValue("pink_shirt")

        
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
