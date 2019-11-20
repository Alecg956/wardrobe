import UIKit

enum Gender {
    case male
    case female
    case other
}

extension UIColor {
    static let greenBG = UIColor(red: 186/255, green: 255/255, blue: 201/255, alpha: 1)
    static let greenBGDisabled = UIColor(red: 186/255, green: 255/255, blue: 201/255, alpha: 0.3)
}

// Add global variables to this struct
struct Global {
    
    // default state is .other
    static var gender: Gender = .other
    
    static var selectedItem:String = ""
    static var selectedType:String = ""
    
    struct ClothingItem {
        var name: String
        var size: Int
        var color: UIColor
    }
    
    static var cart = [ClothingItem]()
    
    enum defaultHeight: Float {
        case male = 70
        case female = 64
        case other = 67
    }
    
    enum defaultWeight: Float {
        case male = 150
        case female = 125
        case other = 138
    }

    //for customize sliders
    static var height:Float = defaultHeight.other.rawValue
    static var weight:Float = defaultWeight.other.rawValue
    
    // corresponds to a medium, negative is smaller, positive is higher
    static var size:Int = 0
    static var minSize = -1
    static var maxSize = 1
    
    static var sizes: [Int: String] = [-1: "S", 0: "M", 1: "L"]
}
