
import Foundation
import UIKit

class CartList {
    var storage: [Cart]
    
    init() {
        self.storage = [Cart]()
    }
    public var Count: Int {
        return storage.count
    }
    
    public func add(image: UIImage?, title: String, size: String, price: String, count: String) {
        self.storage.append(Cart(image: image, title: title, size: size, price: price, count: count))
    }
    
    public func delete(indexRow: Int) {
        self.storage.remove(at: indexRow)
    }
    
    public func itemAt(index: Int) -> Cart {
        return storage[index]
    }
}
