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
    
    lazy var helpButton: testUIButton = {
        
        let button = testUIButton(imageString: "questionmark.circle.fill")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapHelp))

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
    
    // Handler for tapping help button
    @objc func didTapHelp () {
        
        let alert = UIAlertController(title: "Purchase", message: "You can see all the items you have added to your cart, from here you can select the individual purchase buttons next to each item if you wish to buy it!", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
        self.present(alert, animated: true)
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
        self.view.addSubview(helpButton)
        
        helpButton.tintColor = .greenBG
        helpButton.isUserInteractionEnabled = true
        
        NSLayoutConstraint.activate([
            
            helpButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15.0),
            helpButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            helpButton.heightAnchor.constraint(equalToConstant: 50),
            helpButton.widthAnchor.constraint(equalToConstant: 50),
        
        ])
        
        // make label for cart text
        let cartLabel = UILabel()
        cartLabel.text = "Your Cart"
        cartLabel.textAlignment = .center
        cartLabel.font = cartLabel.font.withSize(30)
        cartLabel.frame = CGRect(x: 0, y: barHeight + 75, width: displayWidth, height: 100)
        self.view.addSubview(cartLabel)
    }
}
