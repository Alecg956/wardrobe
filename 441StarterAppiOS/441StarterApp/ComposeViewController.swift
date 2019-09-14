//
//  ComposeViewController.swift
//  441StarterApp
//
//  Created by Alec Goldberg on 9/13/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBAction func submitPost(_ sender: Any) {
        
        let json: [String: Any] = ["username": self.usernameLabel.text ?? "NULL",
                                   "message": self.messageText.text ??
            "I wrote a blank message, oops!"]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        guard let postURL = URL(string: "http://134.209.218.243/addchatt/") else {
            return
        }
        
        var request = URLRequest(url: postURL)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let _ = data, error == nil else {
                print("POST NETWORKING ERROR")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse,
                httpStatus.statusCode != 200 {
                print("HTTP STATUS: \(httpStatus.statusCode)")
                return
            }
        }
        task.resume()
        
        self.dismiss(animated: true)
    }
    
    @IBAction func cancelPost(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
