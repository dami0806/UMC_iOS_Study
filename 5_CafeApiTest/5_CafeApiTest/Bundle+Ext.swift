//
//  Bundle+Ext.swift
//  5_CafeApiTest
//
//  Created by 박다미 on 2023/10/31.
//

import Foundation
extension Bundle {
    
    var API_KEY: String {
        return getSecretKey(key: "API_KEY")
    }
    
    var API_URL: String {
        return getSecretKey(key: "API_URL")
    }
    var NATIVE_APP_KEY: String {
        return Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] as! String
    }
    

    func getSecretKey(key: String) -> String {
        guard let file = self.path(forResource: "SecretKey", ofType: "plist") else { return "" }
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }

        guard let key = resource[key] as? String else {
            fatalError("\(key) error")
        }
        return key
    }
}
