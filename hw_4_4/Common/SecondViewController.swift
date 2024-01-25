//
//  SecondViewController.swift
//  hw_4_4
//
//  Created by Erma on 24/1/24.
//

import UIKit
import SnapKit
class SecondViewController: UIViewController {

    var modelData: Model?
    var count = 1
    var price = 230
        
    private let productImage: UIImageView = MakeView.shared.makerImage(imageName: "chairImage",imageCornerRadius: 16)
    
    private lazy var backBtn: UIButton = MakeView.shared.makerButton(buttonImage: UIImage(named: "backImage"),buttonTintColor: UIColor.init(hex: "#000000"),buttonIsCircular: true,buttonBackgroundColor: UIColor.init(hex: "#FFFFFF"), buttonSelector: #selector(backBtnTapped(sender: )), buttonSelf: self)
    
    private lazy var shareBtn: UIButton = MakeView.shared.makerButton(buttonImage: UIImage(named: "shareImage"),buttonTintColor: UIColor.init(hex: "#000000"),buttonIsCircular: true,buttonBackgroundColor: UIColor.init(hex: "#FFFFFF"), buttonSelector: #selector(shareBtnTapped(sender: )), buttonSelf: self)
    
    private lazy var likeBtn: UIButton = MakeView.shared.makerButton(buttonImage: UIImage(named: "likeImage"),buttonTintColor: UIColor.init(hex: "#000000"),buttonIsCircular: true,buttonBackgroundColor: UIColor.init(hex: "#FFFFFF"), buttonSelector: #selector(likeBtnTapped(sender: )), buttonSelf: self)
    
    private let productNameLabel: UILabel = MakeView.shared.makerLabel(text: "Furniture",textColor: UIColor.init(hex: "#000000"),textSize: 22)
    
    private lazy var starStack:UIStackView = MakeView.shared.makerStack(stackAxis: .horizontal)
    
    private let starImage: UIImageView = MakeView.shared.makerImage(imageName: "starImage")
    

    private let priceLabel: UILabel = MakeView.shared.makerLabel(text: "$230",textColor: UIColor.init(hex: "#007AFF"),textSize: 20)
    
    private lazy var minusBtn:UIButton = MakeView.shared.makerButton(buttonImage: UIImage(systemName: "minus"),buttonTintColor: UIColor.init(hex: "#000000"),buttonIsCircular: true, buttonBackgroundColor: UIColor.init(hex: "#7676801F", alpha: 0.12), buttonSelector: #selector(minusBtnTapped(sender: )), buttonSelf: self)
    
    private lazy var countLabel:UILabel = MakeView.shared.makerLabel(text: "0",textColor: UIColor.init(hex: "#000000"),textSize: 20,textAlighment: .center)
    
    private lazy var plusBtn:UIButton = MakeView.shared.makerButton(buttonImage: UIImage(systemName: "plus"),buttonTintColor: UIColor.init(hex: "#000000"),buttonIsCircular: true, buttonBackgroundColor: UIColor.init(hex: "#7676801F",alpha: 0.12), buttonSelector: #selector(plusBtnTapped(sender: )), buttonSelf: self)
    
    private lazy var productDetailsLabel: UILabel = MakeView.shared.makerLabel(text: "Product Details",textColor: UIColor.init(hex: "#333333"),textSize: 20)
    
    
    
    private lazy var categoryStack: UIStackView = MakeView.shared.makerStack(stackAxis: .vertical)
    
    private lazy var categoryRoomTypeLabel: UILabel = MakeView.shared.makerLabel(text: "Room Type",textColor: UIColor.init(hex: "#333333", alpha: 0.5),textSize: 15)
    private lazy var categoryColorLabel: UILabel = MakeView.shared.makerLabel(text: "Color",textColor: UIColor.init(hex: "#333333", alpha: 0.5),textSize: 15)
    
    private lazy var categoryMaterialLabel: UILabel = MakeView.shared.makerLabel(text: "Material",textColor: UIColor.init(hex: "#333333", alpha: 0.5),textSize: 15)
    
    private lazy var categoryDimensionsLabel: UILabel = MakeView.shared.makerLabel(text: "Dimensions",textColor: UIColor.init(hex: "#333333", alpha: 0.5),textSize: 15)
    
    private lazy var categoryWeightLabel: UILabel = MakeView.shared.makerLabel(text: "Weight",textColor: UIColor.init(hex: "#333333", alpha: 0.5),textSize: 15)
    
    
    private lazy var descriptionCategoryStack: UIStackView = MakeView.shared.makerStack(stackAxis: .vertical)
    
    private lazy var roomDescription: UILabel = MakeView.shared.makerLabel(text: "Office, Living Room",textColor: UIColor.init(hex: "#333333"),textSize: 15)
    
    private lazy var colorDescription: UILabel = MakeView.shared.makerLabel(text: "Yellow",textColor: UIColor.init(hex: "#333333"),textSize: 15)
    
    private lazy var materialDescription: UILabel = MakeView.shared.makerLabel(text: "Textile, Velvet, Cotton",textColor: UIColor.init(hex: "#333333"),textSize: 15)
    
    private lazy var dimensionsDescription: UILabel = MakeView.shared.makerLabel(text: "25.6 x 31.5 x 37.4 inches",textColor: UIColor.init(hex: "#333333"),textSize: 15)
    
    private lazy var weightDescription: UILabel = MakeView.shared.makerLabel(text: "20.3 Pounds",textColor: UIColor.init(hex: "#333333"),textSize: 15)
    
    
    private lazy var buyBtn: UIButton = MakeView.shared.makerButton(buttonSetTitle: "Buy",buttonSetTitleColor: UIColor.init(hex: "#FFFFFF"),buttonTitleSize: 17,buttonImage: nil,buttonCornerRadius: 8,buttonBackgroundColor: UIColor.init(hex: "#007AFF"), buttonSelector: #selector(buyBtnTapped(sender: )), buttonSelf: self)
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
    
    private func setupUI(){
        view.backgroundColor = .white
        view.addSubview(productImage)
        view.addSubview(backBtn)
        view.addSubview(shareBtn)
        view.addSubview(likeBtn)
        view.addSubview(productNameLabel)
        view.addSubview(starStack)
        
        view.addSubview(priceLabel)
        view.addSubview(minusBtn)
        view.addSubview(countLabel)
        view.addSubview(plusBtn)
        view.addSubview(productDetailsLabel)
        view.addSubview(categoryStack)
        categoryStack.addArrangedSubview(categoryRoomTypeLabel)
        categoryStack.addArrangedSubview(categoryColorLabel)
        categoryStack.addArrangedSubview(categoryMaterialLabel)
        categoryStack.addArrangedSubview(categoryDimensionsLabel)
        categoryStack.addArrangedSubview(categoryWeightLabel)
        
        view.addSubview(descriptionCategoryStack)
        descriptionCategoryStack.addArrangedSubview(roomDescription)
        descriptionCategoryStack.addArrangedSubview(colorDescription)
        descriptionCategoryStack.addArrangedSubview(materialDescription)
        descriptionCategoryStack.addArrangedSubview(dimensionsDescription)
        descriptionCategoryStack.addArrangedSubview(weightDescription)
        
        view.addSubview(buyBtn)
        updateLabels()
        updateStars()
        
        setupImage()
        setupButton()
        setupStack()
        setupLabel()
        
        productImage.image = UIImage(named: modelData?.image ?? "")
        productNameLabel.text = modelData?.text ?? ""
    }
    
    
    private func setupImage(){
        productImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(375)
        }
        starImage.snp.makeConstraints { make in
            make.height.width.equalTo(18)
        }
    }
    
    
    private func setupButton(){
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(36)
        }
        shareBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(likeBtn.snp.leading).offset(-16)
            make.height.equalTo(36)
            make.width.equalTo(36)
            
        }
        likeBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(36)
            make.width.equalTo(36)
        }
        minusBtn.snp.makeConstraints { make in
            make.top.equalTo(starStack.snp.bottom).offset(15)
            make.trailing.equalTo(countLabel.snp.leading).offset(-1)
            make.height.width.equalTo(32)
            make.centerY.equalTo(countLabel.snp.centerY)
        }
        plusBtn.snp.makeConstraints { make in
            make.top.equalTo(starStack.snp.bottom).offset(15)
            make.trailing.equalToSuperview().offset(-16)
            make.height.width.equalTo(32)
        }
        buyBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-30)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
        
        
        
    private func setupLabel(){
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(16)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(starStack.snp.bottom).offset(19)
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalTo(minusBtn.snp.centerY)
            
        }
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(starStack.snp.bottom).offset(15)
            make.trailing.equalTo(plusBtn.snp.leading).offset(-1)
            make.height.equalTo(24)
            make.width.equalTo(51)
            make.centerY.equalTo(plusBtn.snp.centerY)
        }
        productDetailsLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(27)
            make.leading.equalToSuperview().offset(16)
        }
    }
        
    private func setupStack(){
        starStack.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(18)
        }
        categoryStack.snp.makeConstraints { make in
            make.top.equalTo(productDetailsLabel.snp.bottom).offset(9)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(120)
        }
        descriptionCategoryStack.snp.makeConstraints { make in
            make.top.equalTo(productDetailsLabel.snp.bottom).offset(9)
            make.leading.equalTo(categoryStack.snp.trailing).offset(18)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(120)
        }
    }
        
    
    
    private func updateStars() {
        for removeStar in starStack.arrangedSubviews {
            removeStar.removeFromSuperview()
        }
        for _ in 0..<count {
            let starImageView = UIImageView(image: UIImage(named: "starImage"))
            starStack.addArrangedSubview(starImageView)
        }
    }
    
    private func updateLabels(){
        countLabel.text = "\(count)"
        priceLabel.text = "$\(count * price)"
    }
    
    
    
    @objc func minusBtnTapped(sender:UIButton){
        if count > 1{
            count-=1
            updateLabels()
            updateStars()
        }
    }
    
    
    @objc func plusBtnTapped(sender:UIButton){
        count+=1
        updateLabels()
        updateStars()
    }
    
    @objc func buyBtnTapped(sender:UIButton){
        
    }
    
    @objc func backBtnTapped(sender:UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func shareBtnTapped(sender:UIButton){
        
    }
    
    @objc func likeBtnTapped(sender:UIButton){
        
        
    }
    }

    





