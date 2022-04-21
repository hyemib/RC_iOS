
import Foundation
import UIKit

class Drink: NSObject {
    static let shared = Drink()
    var drinkTitle: [[String]] = [[]]
    var drinkPrice: [[String]] = [[]]
    var drinkImage: [[String]] = [[]]
    
    private override init() {
        self.drinkTitle = [["그릭 요거트 & 밀크티 크러쉬", "그릭 요거트 & 망고 밀크티 크러쉬", "그릭 요거트 & 딸기 밀크티 크러쉬", "딸기 듬뿍 밀크티", "베리 베리 스무디"], ["블랙 밀크티","얼그레이 밀크티","타로 밀크티","초콜렛 밀크티","제주그린 밀크티"],["자몽 그린티","청포도 그린티","패션 프롯 히비스커스", "망고 요구르트", "자몽 요구르트"],["제주 그린티 스무디", "초콜렛 쿠키&크림 스무디", "딸기 쿠키 스무디", "초코바른 초코 스무디", "초코바른 제주 그린 스무디"],["아메리카노","카페라떼","바닐라 카페라떼","돌체 카페라떼","카라멜 카페라떼"]]
        self.drinkPrice = [["5,500원", "6,300원", "6,500원", "4,900원", "5,300원"],["4,200원", "4,200원", "4,200원","4,200원", "4,700원"],["4,500원", "4,500원", "4,500원", "5,000원", "5,000원"],["5,500원", "5,100원", "5,500원","5,500원", "5,700원"],["3,700원","4,200원","4,500원","4,700원","4,500원"]]
        self.drinkImage = [["newmenu1", "newmenu2", "newmenu3", "newmenu4", "newmenu5"],["milktea1", "milktea2", "milktea3", "milktea4", "milktea5"],["fruit1", "fruit2", "fruit3", "fruit4", "fruit5"],["smoothie1", "smoothie2", "smoothie3", "smoothie4", "smoothie5"],["coffee1", "coffee2", "coffee3", "coffee4", "coffee5"]]
    }
}
