////
////  CheckBoxButtonView.swift
////  3_BaeMinOrderLogic
////
////  Created by 박다미 on 2023/10/02.
////
//
//import Foundation
//import UIKit
//import SnapKit
//
//class CheckBoxButtonView: UIView {
//    private var isChecked: Bool = false
//    private let checkmarkImageView : UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFit
//        image.image = UIImage(systemName: "checkmark")
//        image.tintColor = .blue
//        image.isHidden = true
//        return image
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addSubviews()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    private func addSubviews() {
//        backgroundColor = .clear
//        layer.borderWidth = 1.0
//        layer.borderColor = UIColor.black.cgColor
//  
//        addSubview(checkmarkImageView)
//        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(checkBoxTapped))
//        addGestureRecognizer(tapGesture)
//        
//        configureConstraints()
//    }
// 
//    
//    private func configureConstraints() {
//        checkmarkImageView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//    }
//    
//    func setCheckBoxSelected(_ selected: Bool) {
//        isChecked = selected
//        checkmarkImageView.isHidden = !selected
//    }
//    
//    @objc private func checkBoxTapped() {
//        isChecked.toggle()
//        setCheckBoxSelected(isChecked)
//        NotificationCenter.default.post(name: NSNotification.Name("CheckBoxSelected"), object: self)
//    }
//}
