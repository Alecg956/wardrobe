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
    
    static let defaultMaleHeight:Int = 70
    static let defaultMaleWeight:Int = 150

    static let defaultFemaleHeight:Int = 64
    static let defaultFemaleWeight:Int = 125

    static let defaultOtherHeight:Int = 67
    static let defaultOtherWeight:Int = 138

    //for customize sliders
    static var height:Int = defaultOtherHeight
    static var weight:Int = defaultOtherWeight
    
    // corresponds to a medium, negative is smaller, positive is higher
    static var size:Int = 0
    static var minSize = -1
    static var maxSize = 1
    
    static var sizes: [Int: String] = [-1: "S", 0: "M", 1: "L"]
}
