//
//  BrowseTableViewController.swift
//  wardrobe
//
//  Created by Alec Goldberg on 10/31/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit
import FirebaseDatabase

var test_var = ClothesInfo()
var dog = test_var

class BrowseDetailTableViewController: UITableViewController {
    
    var pageTitle: String = ""
    var pageItems: [pageItem] = []
    //var my_class: ClothesInfo!
    

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
        dismiss(animated: true)
    }
    
    func getItems() {

        // Get green shirt info from database
        let ref = Database.database().reference()


        ref.child("Shirts/Green Shirt").observeSingleEvent(of: .value, with: { (snapshot) in

            let data = snapshot.value as? NSDictionary
            let item = data?["itemName"] as? String ?? ""
            let image = data?["imageName"] as? String ?? ""

            
            dog.imgName = image
            dog.itemName = item
            
            

            })
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        //print(my_class?.imgName)
        
        // call database here
        if (pageTitle == "Shirts") {
            pageItems.append(pageItem(itemName: "Red_Shirt", imageName: "red_shirt"))
            pageItems.append(pageItem(itemName: "Blue_Shirt", imageName: "blue_shirt"))
            pageItems.append(pageItem(itemName: dog.itemName, imageName: dog.imgName))
            //pageItems.append(pageItem(itemName: "Green_Shirt", imageName: "green_shirt"))
            pageItems.append(pageItem(itemName: "Yellow_Shirt", imageName: "yellow_shirt"))
            pageItems.append(pageItem(itemName: "Pink_Shirt", imageName: "pink_shirt"))
        }
    }
}

struct pageItem {
    var itemName: String = ""
    var imageName: String = ""
}

class ClothesInfo {
    var imgName: String = "TEST"
    var itemName: String = "TEST"

    
    //init(InputImgName: String, InputItemName: String) {
    //    self.imgName = InputImgName
    //    self.itemName = InputItemName
    // }
}
