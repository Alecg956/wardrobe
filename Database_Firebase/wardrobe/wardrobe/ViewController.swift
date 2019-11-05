//
//  ViewController.swift
//  wardrobe
//
//  Created by Jannah Mandwee on 11/1/19.
//  Copyright © 2019 App-Makers. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let ref = Database.database().reference()
        ref.child("Clothing/Shirt").setValue("Blue")
        ref.child("Clothing/Shirt").setValue("Red")
        ref.child("Clothing/Pants").setValue("Item1")
        ref.child("Clothing/Pants").setValue("Item2")
        ref.child("Clothing/Pants").setValue("Item3")
        ref.child("Clothing/Pants").setValue("Item4")
    }


}

