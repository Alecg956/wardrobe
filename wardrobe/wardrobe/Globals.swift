import UIKit

enum Gender {
    case male
    case female
    case other
}

// Add global variables to this struct
struct Global {
    
    // default state is .other
    static var gender: Gender = .other
    
    static let greenBG = UIColor(red: 186/255, green: 255/255, blue: 201/255, alpha: 1)
    
    static var selectedItem:String = ""
}
