//
//  testUIButton.swift
//  wardrobe
//
//  Created by Alec Goldberg on 11/7/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//
import UIKit

class testUIButton: UIButton {
    
    init(imageString: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        tintColor = Global.greenBG
        setImage(UIImage(systemName: imageString), for: .normal)
        imageView?.contentMode = .scaleToFill
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: selector)
        
//        addGestureRecognizer(tapGesture)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




//lazy var sizeDownButton: UIButton = {
//
//    let button = UIButton()
//    button.translatesAutoresizingMaskIntoConstraints = false
//
//    button.tintColor = Global.greenBG
//    button.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
//    button.imageView?.contentMode = .scaleToFill
//    button.contentHorizontalAlignment = .fill
//    button.contentVerticalAlignment = .fill
//
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSizeDown))
//
//    button.addGestureRecognizer(tapGesture)
//    return button
//}()
