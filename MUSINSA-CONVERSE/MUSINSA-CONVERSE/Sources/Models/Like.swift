
import Foundation

class Like {
    var imageName: String?
    var title: String?
    var price: String?
    var starCount: String?
    var heartCount: String?
    var like: Bool?
    
    init(imageName: String, title: String, price: String, starCount: String, heartCount: String, like: Bool) {
        self.imageName = imageName
        self.title = title
        self.price = price
        self.starCount = starCount
        self.heartCount = heartCount
        self.like = like
    }
}
