//
//  MakerView.swift
//  hw_4_4
//
//  Created by Erma on 25/1/24.
//

import UIKit
class MakeView{
    
    static let shared = MakeView()
    
    func makerLabel(text:String = "",
                    textColor: UIColor = .white,
                    textSize:CGFloat = 20,
                    textWeight:UIFont.Weight = .regular,
                    textAlighment: NSTextAlignment = .left
                    ) -> UILabel {
        let view = UILabel()
        view.text = text
        view.textColor = textColor
        view.font = .systemFont(ofSize: textSize,weight: textWeight)
        view.textAlignment = textAlighment
        return view
    }
    
    
    func makerView(viewBackgroundColor: UIColor = .white,
                   viewCornerRadius: CGFloat = 0) -> UIView{
        let view = UIView()
        view.backgroundColor = viewBackgroundColor
        view.layer.cornerRadius = viewCornerRadius
        return view
    }
    
    

    func makerImage(imageName: String = "",
                    imageContentMode: UIView.ContentMode = .scaleAspectFill,
                    imageBackgroundColor: UIColor = .white,
                    imageCornerRadius:CGFloat = 16,
                    imageMakeToBounds: Bool = false
                    )-> UIImageView{
        let view = UIImageView()
        view.image = UIImage(named: imageName)
        view.contentMode = imageContentMode
        view.backgroundColor = imageBackgroundColor
        view.layer.cornerRadius = imageCornerRadius
        view.layer.masksToBounds = imageMakeToBounds
        return view
    }
    
    func makerButton(buttonSetTitle: String = "",
                     buttonSetTitleFor: UIControl.State = .normal,
                     buttonSetTitleColor: UIColor = .black,
                     buttonTitleSize : CGFloat = 20,
                     buttonImage: UIImage?,
                     buttonTintColor: UIColor = .white,
                     buttonIsCircular: Bool = false,
                     buttonCornerRadius: CGFloat = 12,
                     buttonBackgroundColor: UIColor = .white,
                     buttonTitleWeight: UIFont.Weight = .regular,
                     buttonSelector: Selector,
                     buttonSelf: Any?,
                     buttonControl: UIControl.Event = .touchUpInside,
                     buttonIsEnabled: Bool = true
                     )-> UIButton{
        let view = UIButton(type: .system)
        view.setTitle(buttonSetTitle, for: buttonSetTitleFor)
        view.setTitleColor(buttonSetTitleColor, for: buttonSetTitleFor)
        
        if buttonIsCircular {
            view.layer.cornerRadius = view.frame.size.width / 2
            view.layer.masksToBounds = true
            } else {
            view.layer.cornerRadius = buttonCornerRadius
            }
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: buttonTitleSize,weight: buttonTitleWeight)
        view.setImage(buttonImage, for: buttonSetTitleFor)
        view.tintColor = buttonTintColor
        view.layer.cornerRadius = buttonCornerRadius
        view.backgroundColor = buttonBackgroundColor
        view.addTarget(buttonSelf, action: buttonSelector, for: buttonControl)
        view.isEnabled = buttonIsEnabled
    
       
        return view
       
    }
    
    
    func makerStack(stackAxis: NSLayoutConstraint.Axis = .vertical,
                    stackDistribution: UIStackView.Distribution = .fillEqually,
                    stackSpacing: CGFloat = 0
    )-> UIStackView{
        let view = UIStackView()
        view.axis = stackAxis
        view.distribution = stackDistribution
        view.spacing = stackSpacing
        return view
    }
}




