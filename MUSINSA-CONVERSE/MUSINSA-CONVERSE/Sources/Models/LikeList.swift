
import Foundation
import UIKit

class LikeList {
    var storage: [Like]
    
    init() {
        self.storage = [Like]()
    }
    public var Count: Int {
        return storage.count
    }
    
    public func add(imageName: String, title: String, price: String, starCount: String, heartCount: String, like: Bool) {
        self.storage.append(Like(imageName: imageName, title: title, price: price, starCount: starCount, heartCount: heartCount, like: like))
    }
    
    public func delete(indexRow: Int) {
        self.storage.remove(at: indexRow)
    }
    
    public func itemAt(index: Int) -> Like {
        return storage[index]
    }
}
