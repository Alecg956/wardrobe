//
//  PurchaseViewController.swift
//  wardrobe
//
//  Created by Jackson McIntyre on 11/2/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var clothes: [String] = []
    var myTableView: UITableView!


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(clothes[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clothes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(clothes[indexPath.row])"
        return cell
    }
    
    
    
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
        
        myTableView.reloadData()
        
        clothes.removeAll()
        clothes.append(Global.selectedItem)
        
        
        if Global.selectedItem == "" {
            purchaseButton.isEnabled = false
            purchaseButton.alpha = 0.5
        } else {
            purchaseButton.isEnabled = true
            purchaseButton.alpha = 1.0
        }
    }
    
    func getURL() -> String {
        var url = ""
        switch Global.selectedItem {
        case "Red_Shirt":
            url = "https://www.amazon.com/Soffe-Long-Sleeve-Cotton-T-Shirt-Cardinal/dp/B003AU5WIC/ref=sr_1_33?dchild=1&keywords=red+t+shirt&psc=1&qid=1572904360&s=apparel&sr=1-33"
        case "Blue_Shirt":
            url = "https://www.amazon.com/Soffe-Long-Sleeve-Cotton-T-Shirt-Royal/dp/B003AU5WH8/ref=sr_1_39?dchild=1&keywords=blue+t+shirt&psc=1&qid=1572901755&s=apparel&sr=1-39"
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
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
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
