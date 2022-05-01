
import Foundation
import UIKit

class Cart {
    var image: UIImage?
    var title: String
    var size: String
    var price: String
    var count: String
    
    init(image: UIImage?, title: String, size: String, price: String, count: String) {
        self.image = image
        self.title = title
        self.size = size
        self.price = price
        self.count = count
    }
}
