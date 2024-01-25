//
//  CustomTableViewCell.swift
//  hw_4_4
//
//  Created by Erma on 24/1/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    private lazy var cellView: UIView = MakeView.shared.makerView(viewBackgroundColor: UIColor.init(hex: "#FFFFFF"))
        

    private let productImage: UIImageView = MakeView.shared.makerImage(imageName: "furnitureImage",imageCornerRadius: 16,imageMakeToBounds: true)
        
    
    private let productNameLabel: UILabel = MakeView.shared.makerLabel(text: "Furniture",textColor: UIColor.init(hex: "#000000"),textSize: 20)
    

    private let productCountLabel: UILabel = MakeView.shared.makerLabel(text: "785 Items",textColor: UIColor.init(hex: "#7F7F7F", alpha: 0.5),textSize: 15)
        
    
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            
            
            contentView.addSubview(cellView)
            
            cellView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.height.equalTo(220)
                make.horizontalEdges.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().offset(-19)
            }
            
            cellView.addSubview(productImage)
                    
            productImage.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.horizontalEdges.equalToSuperview()
                make.height.equalTo(166)
                
            }
            
            
            cellView.addSubview(productNameLabel)
            productNameLabel.snp.makeConstraints { make in
                make.top.equalTo(productImage.snp.bottom).offset(6)
                make.leading.equalToSuperview()
                make.height.equalTo(24)
            }
            
            cellView.addSubview(productCountLabel)
            productCountLabel.snp.makeConstraints { make in
                make.top.equalTo(productNameLabel.snp.bottom).offset(2)
                make.leading.equalToSuperview()
                make.height.equalTo(20)
            }
        }
        
    func setImageData(_ image:String,_ text: String,_ textCount: String) {
            productImage.image = UIImage(named: image)
            productNameLabel.text = text
            productCountLabel.text = textCount
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
