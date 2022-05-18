
import UIKit

var cartList = CartList()

class FirstTabBarController: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderViewDelegate {
    
    var checks = [Int]()
    var total = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalCount: UILabel!
    @IBOutlet weak var totalButton: UIButton!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        let nib1 = UINib(nibName: "CartListTableViewCell1", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "CartListTableViewCell1")
        let nib2 = UINib(nibName: "CartListTableViewCell2", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "CartListTableViewCell2")
        
        if cartList.Count == 0 {
            centerLabel.text = "쇼핑 계속하기"
        }
    }
    
    func pressedXBtn(for index: Int) {
        cartList.delete(indexRow: index)
        if cartList.Count == 0 {
            totalCount.text = ""
            centerLabel.text = "쇼핑 계속하기"
            totalPrice.text = ""
        }
        tableView.reloadData()
    }
    
    func pressedPlusBtn(for index: Int) {
        cartList.itemAt(index: index).count = "\(Int(cartList.itemAt(index: index).count)!+1)"
        tableView.reloadData()
    }
    
    func pressedMinusBtn(for index: Int) {
        if Int(cartList.itemAt(index: index).count)! > 1 {
            cartList.itemAt(index: index).count = "\(Int(cartList.itemAt(index: index).count)! - 1)"
            tableView.reloadData()
        }
    }
    
    @IBAction func pressedPurchaseBtn(_ sender: UIButton) {
        if cartList.Count == 0 {
            guard let HomeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
            HomeVC.modalPresentationStyle = .overCurrentContext
            self.navigationController?.pushViewController(HomeVC, animated: false)
        } else {
            cartList.storage.removeAll()
            totalCount.text = ""
            centerLabel.text = "쇼핑 계속하기"
            totalPrice.text = ""
            tableView.reloadData()
        }
    }
    
}

extension FirstTabBarController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 2
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return cartList.Count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartListTableViewCell1", for: indexPath) as! CartListTableViewCell1
            cell.totalCount?.text = "\(cartList.Count)개"
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartListTableViewCell2", for: indexPath) as! CartListTableViewCell2
        
        let cellData = cartList.itemAt(index: indexPath.row)
        cell.delegate = self
        cell.index = indexPath.row
        cell.productImage?.image = cellData.image
        cell.productTitle?.text = cellData.title

        cell.productCount?.text = cellData.count
        let countMulPrice = String(Int(cellData.count)! * Int(cellData.price.filter{$0.isNumber})!)
        let priceToString = "\(countMulPrice.prefix(countMulPrice.count-3)),\(countMulPrice.suffix(3))원"
        cell.productPrice?.text = priceToString
        cell.productSize?.text = cellData.size
        var cnt = 0
        for i in 0..<cartList.storage.count {
            cnt += Int(cartList.storage[i].count)!
        }
        totalCount.text = "총 \(cnt)개"
        centerLabel.text = "|"
        
        var totalArr = [Int]()
        for i in 0..<cartList.storage.count {
            totalArr.append(Int(cartList.storage[i].count)! * Int(cartList.storage[i].price.filter{$0.isNumber})!)
        }
        let totalValue = String(totalArr.reduce(0, +))
        totalPrice.text = "\(totalValue.prefix(totalValue.count-3)),\(totalValue.suffix(3))원 결제하기"
        
       return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: {
            let previewVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController
            previewVC?.image = cartList.storage[indexPath.item].image
            return previewVC
        }, actionProvider: nil)
    }
}

