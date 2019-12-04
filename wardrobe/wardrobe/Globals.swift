import UIKit
import SwiftGifOrigin

extension UIImage {
  public class func gif(asset: String) -> UIImage? {
    if let asset = NSDataAsset(name: asset) {
       return UIImage.gif(data: asset.data)
    }
    return nil
  }
}

enum Gender {
    case male
    case female
    case other
}

extension UIColor {
    static let greenBG = UIColor(red: 186/255, green: 255/255, blue: 201/255, alpha: 1)
    static let greenBGDisabled = UIColor(red: 186/255, green: 255/255, blue: 201/255, alpha: 0.3)
    static let clothingRed = UIColor(red: 255/255, green: 154/255, blue: 162/255, alpha: 1)
    static let clothingPink = UIColor(red: 255/255, green: 183/255, blue: 178/255, alpha: 1)
    static let clothingOrange = UIColor(red: 255/255, green: 218/255, blue: 193/255, alpha: 1)
    static let clothingGreen = UIColor(red: 181/255, green: 234/255, blue: 215/255, alpha: 1)
    static let clothingBlue = UIColor(red: 160/255, green: 216/255, blue: 255/255, alpha: 1)
    static let clothingKhaki = UIColor(red: 195/255, green: 176/255, blue: 145/255, alpha: 1)
    static let darkGreen = UIColor(red: 120/255, green: 146/255, blue: 107/255, alpha: 1)
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
        var color: String
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
        case other = 140
    }
    
    enum defaultChest: Float {
        case male = 42
        case female = 37
        case other = 40
    }
    
    enum defaultWaist: Float {
        case male = 40
        case female = 38
        case other = 39
    }

    //for customize sliders
    static var height:Float = defaultHeight.other.rawValue
    static var weight:Float = defaultWeight.other.rawValue
    static var chest:Float = defaultChest.other.rawValue
    static var waist:Float = defaultWaist.other.rawValue
    
    // corresponds to a medium, negative is smaller, positive is higher
    static var size:Int = 0
    static var minSize = -1
    static var maxSize = 1
    
    static var sizes: [Int: String] = [-1: "S", 0: "M", 1: "L"]
}
