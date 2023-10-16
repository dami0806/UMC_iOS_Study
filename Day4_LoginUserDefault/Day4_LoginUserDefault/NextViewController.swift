//
//  NextViewController.swift
//  Day4_LoginUserDefault
//
//  Created by 박다미 on 2023/10/08.
//

import Foundation
import UIKit
import SnapKit

class NextViewController : UIViewController{
    var userName: String = ""
    var password: String = ""
    
    private lazy var DataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(DataLabel)
        DataLabel.text = "userName: \(userName) password: \(password) "
        DataLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    
    
 
}
