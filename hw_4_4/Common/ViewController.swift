



import UIKit
import SnapKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let shopTableView = UITableView()
    
    private let shopList: [Model] = [Model(image: "furnitureImage", text: "Furniture", countText: "785 Items"),
                                     Model(image: "kitchenWareImage", text: "Kitchenware", countText: "645 Items"),
                                     Model(image: "readingTableImage", text: "Reading Table", countText: "Inventory")]
                                       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    
    private func setupUI(){
        view.backgroundColor = UIColor.init(hex: "#FFFFFF")
        
        shopTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        
        shopTableView.dataSource = self
        shopTableView.delegate = self
        
        view.addSubview(shopTableView)
        
        shopTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(220)
            make.bottom.equalToSuperview()
        }
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shopList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.setImageData(shopList[indexPath.row].image,
                          shopList[indexPath.row].text,
                          shopList[indexPath.row].countText)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = SecondViewController()

        vc.modelData = shopList[indexPath.row]

        navigationController?.pushViewController(vc, animated: true)
        
    }
}





















extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
