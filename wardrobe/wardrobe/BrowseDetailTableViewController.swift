//
//  BrowseTableViewController.swift
//  wardrobe
//
//  Created by Alec Goldberg on 10/31/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit
import FirebaseDatabase

class BrowseDetailTableViewController: UITableViewController {
    
    var pageTitle: String = ""
    var pageItems: [pageItem] = []
    var categoryIndex: Int = 0
    var test_var = pageItem()

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
    
    let ref = Database.database().reference()
    
    func getItems() {
        Global.selectedType = pageTitle


        ref.child("Shirts/Button Up Shirt").observeSingleEvent(of: .value, with: { (snapshot) in

            let data = snapshot.value as? NSDictionary
            let item = data?["itemName"] as? String ?? ""
            let image = data?["imageName"] as? String ?? ""
            
            //let test_var = clothesInfo(itemName: item, imgName: image)
            if (self.pageTitle == "Shirts") {
                self.pageItems.append(pageItem(itemName: item, imageName: image))

                // self.test_var.itemName = item
                // self.test_var.imageName = image
            }
            self.tableView.reloadData()
        })

        ref.child("Bottoms/Chinos").observeSingleEvent(of: .value, with: { (snapshot) in

            let data = snapshot.value as? NSDictionary
            let item = data?["itemName"] as? String ?? ""
            let image = data?["imageName"] as? String ?? ""

            if (self.pageTitle == "Bottoms") {
                self.pageItems.append(pageItem(itemName: item, imageName: image))
            }
            self.tableView.reloadData()
        })

        ref.child("Footwear/Sneakers").observeSingleEvent(of: .value, with: { (snapshot) in

            let data = snapshot.value as? NSDictionary
            let item = data?["itemName"] as? String ?? ""
            let image = data?["imageName"] as? String ?? ""

            if (self.pageTitle == "Footwear") {
                self.pageItems.append(pageItem(itemName: item, imageName: image))
            }
            self.tableView.reloadData()
        })
        ref.child("Accessories/Cap").observeSingleEvent(of: .value, with: { (snapshot) in

            let data = snapshot.value as? NSDictionary
            let item = data?["itemName"] as? String ?? ""
            let image = data?["imageName"] as? String ?? ""

            if (self.pageTitle == "Accessories") {
                self.pageItems.append(pageItem(itemName: item, imageName: image))
            }
            self.tableView.reloadData()
        })

        ref.child("Dresses/Dress").observeSingleEvent(of: .value, with: { (snapshot) in

            let data = snapshot.value as? NSDictionary
            let item = data?["itemName"] as? String ?? ""
            let image = data?["imageName"] as? String ?? ""

            if (self.pageTitle == "Dresses") {
                self.pageItems.append(pageItem(itemName: item, imageName: image))
            }
            self.tableView.reloadData()
        })

        // // call database here
        // if (pageTitle == "Shirts") {
        //     pageItems.append(pageItem(itemName: "Red_Shirt", imageName: "red_shirt"))
        //    // pageItems.append(pageItem(itemName: "Blue_Shirt", imageName: "blue_shirt"))
        //       pageItems.append(pageItem(itemName: test_var.itemName, imageName: test_var.imageName))
        //    // pageItems.append(pageItem(itemName: "Green_Shirt", imageName: "green_shirt"))
        //    // pageItems.append(pageItem(itemName: "Yellow_Shirt", imageName: "yellow_shirt"))
        //    // pageItems.append(pageItem(itemName: "Pink_Shirt", imageName: "pink_shirt"))
            
        //     //self.tableView.reloadData()
        // }
        
        
//<<<<<<< HEAD
//        Global.selectedType = pageTitle
//        // call database here
//        if (pageTitle == "Shirts") {
//            pageItems.append(pageItem(itemName: "Button_Up_Shirt", imageName: "button_up_shirt"))
//        } else if (pageTitle == "Bottoms") {
//            pageItems.append(pageItem(itemName: "Chinos", imageName: "chinos"))
//        } else if (pageTitle == "Footwear") {
//            pageItems.append(pageItem(itemName: "Sneakers", imageName: "sneakers"))
//        } else if (pageTitle == "Accessories") {
//            pageItems.append(pageItem(itemName: "Cap", imageName: "cap"))
//        } else if (pageTitle == "Dresses") {
//            pageItems.append(pageItem(itemName: "Dress", imageName: "dress"))
//        }
//=======
//>>>>>>> database
    }
}

struct pageItem {
    var itemName: String = "test"
    var imageName: String = "test"
}

class clothesInfo {
    var itemName: String
    var imgName: String
    
    init(itemName: String, imgName: String) {
        self.itemName = itemName
        self.imgName = imgName
    }
}
