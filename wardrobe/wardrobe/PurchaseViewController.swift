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
    
    lazy var purchaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .greenBG
        button.tintColor = .greenBG
        button.layer.cornerRadius = 5
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        button.setTitle("Make Purchase!", for: .normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapPurchase))
        
        button.addGestureRecognizer(tapGesture)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        clothes = Global.cart
        
        myTableView.reloadData()
        
        if Global.cart.isEmpty {
            purchaseButton.isEnabled = false
            purchaseButton.alpha = 0.5
        } else {
            purchaseButton.isEnabled = true
            purchaseButton.alpha = 1.0
        }
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
    
    func getURL() -> String {
        var url = ""
        switch Global.selectedItem {
        case "Button_Up_Shirt":
            url = "https://www.amazon.com/Amazon-Essentials-Regular-Fit-Long-Sleeve-Oxford/dp/B06XW9S1JL/ref=sr_1_5?crid=2LDAZTVEDIXQ3&dchild=1&keywords=white+button+up+shirt+men&qid=1573862215&sprefix=white+button+up+shirt%2Caps%2C155&sr=8-5"
        case "Chinos":
            url = "https://www.amazon.com/Amazon-Essentials-Slim-Fit-Wrinkle-Resistant-Flat-Front/dp/B07756KXN4/ref=sr_1_2_sspa?keywords=white+chinos+men&qid=1573862236&sr=8-2-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEzVThBRTRGQkZMN04wJmVuY3J5cHRlZElkPUEwNjI4NTgxMk1LMExVSk1GQUgxSiZlbmNyeXB0ZWRBZElkPUEwODQ5NzA3MkxUNVNZVjE5TlZKTSZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU="
        default:
            url = "https://www.amazon.com"
        }
        return url
    }
 
    // Handler for tapping purchase button
    @objc func didTapPurchase() {
        
        if let url = URL(string: getURL()) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    //setup buttons
    func setupUI() {
        
        self.view.addSubview(purchaseButton)
        
        NSLayoutConstraint.activate([
            
            purchaseButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            purchaseButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100.0),
        
        ])
        
        
        let barHeight: CGFloat = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height / 4

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
