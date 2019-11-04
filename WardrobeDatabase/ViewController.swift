//
//  ViewController.swift
//  wardrobe
//
//  Created by Jannah Mandwee on 11/4/19.
//  Copyright © 2019 App-Makers. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let ref = Database.database().reference()
        ref.child("Customer/Customer1/Name").setValue("Bob")
    }


}

