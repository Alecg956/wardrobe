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
    var gender: Gender = .other
    
    func getCategories() {
        
        switch Global.gender {
        case .male:
            categories = ["Shirts", "Bottoms", "Footwear", "Accessories"]
        case .female:
            categories = ["Shirts", "Bottoms", "Footwear", "Accessories", "Dresses"]
        case .other:
            categories = ["Shirts", "Bottoms", "Footwear", "Accessories", "Dresses"]
        }
        
        if Global.gender != gender {
            tableView.reloadData()
        }
        
        gender = Global.gender
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference()

        ref.child("Shirts/Button Up Shirt/itemName").setValue("Button_Up_Shirt")
        ref.child("Shirts/Button Up Shirt/imageName").setValue("button_up_shirt")
        ref.child("Shirts/Button Up Shirt/itemLink").setValue("https://www.amazon.com/Amazon-Essentials-Regular-Fit-Long-Sleeve-Oxford/dp/B06XWLZBK3/")
        
        ref.child("Bottoms/Chinos/itemName").setValue("Chinos")
        ref.child("Bottoms/Chinos/imageName").setValue("chinos")
        ref.child("Bottoms/Chinos/itemLink").setValue("https://www.amazon.com/Amazon-Essentials-Slim-Fit-Wrinkle-Resistant-Flat-Front/dp/B07756KXN4/")
        
        ref.child("Footwear/Sneakers/itemName").setValue("Sneakers")
        ref.child("Footwear/Sneakers/imageName").setValue("sneakers")
        ref.child("Footwear/Sneakers/itemLink").setValue("https://www.amazon.com/Converse-Chuck-Taylor-Classic-Sneakers/dp/B01G4AU46Y/")
        
        ref.child("Accessories/Cap/itemName").setValue("Cap")
        ref.child("Accessories/Cap/imageName").setValue("cap")
        ref.child("Accessories/Cap/itemLink").setValue("https://www.amazon.com/Carhartt-Medium-Profile-Percent-Cotton/dp/B00MNLKARM/")
        
        ref.child("Dresses/Dress/itemName").setValue("Dress")
        ref.child("Dresses/Dress/imageName").setValue("dress")
        ref.child("Dresses/Dress/itemLink").setValue("https://www.amazon.com/Amazon-Essentials-Womens-Surplice-Burgundy/dp/B07JN9HYHX/")
        
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
