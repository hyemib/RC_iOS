
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
            HomeModel(imageName: "productImg1", title: "척테일러 올스타 블랙 옥스M9166C", price: "55,000원", star: "31,088", heart: "9,999+"),
            HomeModel(imageName: "productImg2", title: "척 70 클래식 블랙 162058C", price: "95,000원", star: "34,586", heart: "9,999+"),
            HomeModel(imageName: "productImg3", title: "척 70 클래식 블랙 162050C", price: "99,000원", star: "27,123", heart: "9,999+"),
            HomeModel(imageName: "productImg4", title: "척테일러 올스타 블랙 하이 M9160C", price: "59,000원", star: "16,340", heart: "9,999+"),
            HomeModel(imageName: "productImg5", title: "척테일러 올스타 화이트 옥스 M7652C", price: "55,000원", star: "6,299", heart: "9,999+"),
            HomeModel(imageName: "productImg6", title: "척 70 클래식 파치먼트 162062C", price: "95,000원", star: "10,369", heart: "9,999+"),
            HomeModel(imageName: "productImg7", title: "척테일러 올스타 캔버스 리프트 화이트 560251C", price: "75,000원", star: "3,545", heart: "9,999+"),
            HomeModel(imageName: "productImg8", title: "런스타 하이크 블랙 166800C", price: "109,000원", star: "6,158", heart: "9,999+"),
            HomeModel(imageName: "productImg9", title: "척 70 클래식 파치먼트 162053C", price: "109,000원", star: "6,056", heart: "9,999+"),
            HomeModel(imageName: "productImg10", title: "척 70 빈티지 캔버스 하이트 162065C", price: "99,000원", star: "4,038", heart: "9,999+"),
            HomeModel(imageName: "productImg11", title: "척테일러 올스타 화이트 하이 M7650C", price: "95,000원", star: "2,166", heart: "9,630"),
            HomeModel(imageName: "productImg12", title: "척테일러 올스타 무브 블랙 570256C", price: "59,000원", star: "1,522", heart: "8,672"),
            HomeModel(imageName: "productImg13", title: "척테일러 올스타 클래식 레이드 M9696C", price: "79,000원", star: "1,312", heart: "9,581"),
            HomeModel(imageName: "productImg14", title: "척 70 빈티지 캔버스 썬플라워 162063C", price: "55,000원", star: "3,003", heart: "9,879"),
            HomeModel(imageName: "productImg15", title: "척 70 빈티지 캔버스 하이트 162056C", price: "75,000원", star: "2,912", heart: "9,806"),
            HomeModel(imageName: "productImg16", title: "척테일러 올스타 클래식 네이비 M9697C", price: "55,000원", star: "1,189", heart: "9,662")
        ]]
        
    }
}
struct HomeModel {
    var imageName: String = ""
    var title: String?
    var price: String?
    var star: String?
    var heart: String?
}




