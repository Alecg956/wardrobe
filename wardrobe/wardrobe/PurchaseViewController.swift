//
//  PurchaseViewController.swift
//  wardrobe
//
//  Created by Jackson McIntyre on 11/2/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var clothes = Global.cart
    var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        clothes = Global.cart
        
        myTableView.reloadData()
    }
    
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(clothes[indexPath.row])")
    }*/

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clothes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:PurchaseTableViewCell.reuseIdentifier, for: indexPath) as? PurchaseTableViewCell else {
            
            return UITableViewCell()
            
        }
            
        cell.itemLabel.text = "\(clothes[indexPath.row].name)"
        cell.itemImageView.image = UIImage(named: clothes[indexPath.row].name.lowercased())
        cell.sizeLabel.text = "Size: \(Global.sizes[clothes[indexPath.row].size] ?? "M")"
        if clothes[indexPath.row].color != "color" {
            cell.colorLabel.text = "Color: \(clothes[indexPath.row].color)"
        }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")

        clothes.remove(at: indexPath.row)
        Global.cart.remove(at: indexPath.row)
        myTableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
    //setup buttons
    func setupUI() {
        
        let barHeight: CGFloat = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height / 3

        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight + 150, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(PurchaseTableViewCell.self, forCellReuseIdentifier: PurchaseTableViewCell.reuseIdentifier)
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
        // make label for cart text
        let cartLabel = UILabel()
        cartLabel.text = "Your Cart"
        cartLabel.textAlignment = .center
        cartLabel.font = cartLabel.font.withSize(30)
        cartLabel.frame = CGRect(x: 0, y: barHeight + 50, width: displayWidth, height: 100)
        self.view.addSubview(cartLabel)
    }
}
