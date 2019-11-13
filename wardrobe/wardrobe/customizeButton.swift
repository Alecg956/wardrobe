//
//  customizeButton.swift
//  wardrobe
//
//  Created by Jackson McIntyre on 11/11/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit

class customizeButton: UIButton {
    
    init(title: String ) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .greenBG
        tintColor = .greenBG
        layer.borderWidth = 5
        layer.borderColor = UIColor.greenBG.cgColor
        layer.cornerRadius = 5
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        setTitle(title, for: .normal)
        setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
