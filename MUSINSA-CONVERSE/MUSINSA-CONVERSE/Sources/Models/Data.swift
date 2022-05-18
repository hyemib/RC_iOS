
import Foundation

class Data: NSObject {
    static let shared = Data()
    var HomeData: [[HomeModel]] = [[]]
    
    private override init() {
        self.HomeData = [[
            HomeModel(imageName: "bannerImg1", title: "페인트 스플래터"),
            HomeModel(imageName: "bannerImg2", title: "에너지 바이브"),
            HomeModel(imageName: "bannerImg3", title: "아카이브 프린트"),
            HomeModel(imageName: "bannerImg4", title: "블랙핀스트라이프"),
            HomeModel(imageName: "bannerImg5", title: "리뉴"),
            HomeModel(imageName: "bannerImg6", title: "척 70뮬")
        ],[
            HomeModel(imageName: "categoryImg1", title: "스니커즈"),
            HomeModel(imageName: "categoryImg2", title: "상의"),
            HomeModel(imageName: "categoryImg3", title: "신발"),
            HomeModel(imageName: "categoryImg4", title: "바지"),
            HomeModel(imageName: "categoryImg5", title: "모자"),
            HomeModel(imageName: "categoryImg6", title: "가방")
        ],[
            HomeModel(imageName: "productImg1", price: "55,000원"),
            HomeModel(imageName: "productImg2", price: "95,000원"),
            HomeModel(imageName: "productImg3", price: "99,000원"),
            HomeModel(imageName: "productImg6", price: "95,000원"),
            HomeModel(imageName: "productImg7", price: "75,000원")
        ],[
            HomeModel(imageName: "productImg1", title: "척테일러 올스타 블랙 옥스M9166C", price: "55,000원", starCount: "31,088", heartCount: "9,999+", like: false),
            HomeModel(imageName: "productImg2", title: "척 70 클래식 블랙 162058C", price: "95,000원", starCount: "34,586", heartCount: "9,999+", like: false),
            HomeModel(imageName: "productImg3", title: "척 70 클래식 블랙 162050C", price: "99,000원", starCount: "27,123", heartCount: "9,999+", like: false),
            HomeModel(imageName: "productImg4", title: "척테일러 올스타 블랙 하이 M9160C", price: "59,000원", starCount: "16,340", heartCount: "9,999+", like: false),
            HomeModel(imageName: "productImg5", title: "척테일러 올스타 화이트 옥스 M7652C", price: "55,000원", starCount: "6,299", heartCount: "9,999+", like: false),
            HomeModel(imageName: "productImg6", title: "척 70 클래식 파치먼트 162062C", price: "95,000원", starCount: "10,369", heartCount: "9,999+", like: false),
            HomeModel(imageName: "productImg7", title: "척테일러 올스타 캔버스 리프트 화이트 560251C", price: "75,000원", starCount: "3,545", heartCount: "9,999+", like: false),
            HomeModel(imageName: "productImg8", title: "런스타 하이크 블랙 166800C", price: "109,000원", starCount: "6,158", heartCount: "9,999+", like: false),
            HomeModel(imageName: "productImg9", title: "척 70 클래식 파치먼트 162053C", price: "109,000원", starCount: "6,056", heartCount: "9,999+", like: false),
            HomeModel(imageName: "productImg10", title: "척 70 빈티지 캔버스 하이트 162065C", price: "99,000원", starCount: "4,038", heartCount: "9,999+", like: false),
            HomeModel(imageName: "productImg11", title: "척테일러 올스타 화이트 하이 M7650C", price: "95,000원", starCount: "2,166", heartCount: "9,630", like: false),
            HomeModel(imageName: "productImg12", title: "척테일러 올스타 무브 블랙 570256C", price: "59,000원", starCount: "1,522", heartCount: "8,672", like: false)
           
        ]]
    }
}
struct HomeModel {
    var imageName: String = ""
    var title: String?
    var price: String?
    var starCount: String?
    var heartCount: String?
    var like: Bool?
}




