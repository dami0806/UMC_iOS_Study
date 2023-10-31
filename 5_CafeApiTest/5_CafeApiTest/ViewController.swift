//
//  ViewController.swift
//  5_CafeApiTest
//
//  Created by 박다미 on 2023/10/31.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Alamofire

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupTableView()
        fetchDataFromAPI()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.register(CafeTableViewCell.self, forCellReuseIdentifier: CafeTableViewCell.reuseIdentifier)
    }
    
    func fetchDataFromAPI() {
        
        let apiUrl = API_KEY.url
        let apiKey = API_KEY.key
        let parameters: [String: Any] = ["serviceKey": apiKey]
        
        AF.request(apiUrl, method: .get, parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let response = try JSONDecoder().decode(CafeAPIResponse.self, from: data)
                            // API 응답을 성공적으로 처리
                            for cafe in response.response.body.items.item {
                                print("카페명: \(cafe.CAFE_NM)")
                                if let telNumber = cafe.TELNO {
                                    print("전화번호: \(telNumber)")
                                }
                                print("주소: \(cafe.ADRES)")
                                if let homepage = cafe.HMPG_NM {
                                    print("홈페이지: \(homepage)")
                                }
                                print("----------")
                            }
                        } catch {
                            // JSON 디코딩 오류 처리
                            print("JSON Decoding Error: \(error)")
                        }
                    } else {
                        // 데이터가 없음
                        print("No data in response")
                    }
                case .failure(let error):
                    // Alamofire 오류 처리
                    print("Alamofire Error: \(error)")
                }
            }
    }
}

struct CafeAPIResponse: Codable {
    let response: CafeResponse
}

struct CafeResponse: Codable {
    let header: Header
    let body: CafeResponseBody
}

struct Header: Codable {
    let resultCode: String
    let resultMsg: String
}

struct CafeResponseBody: Codable {
    let items: CafeItems
    let numOfRows: Int
    let pageNo: Int
    let totalCount: Int
}

struct CafeItems: Codable {
    let item: [Cafe]
}

struct Cafe: Codable {
    let CAFE_NM: String
    let TELNO: String?
    let ADRES: String
    let HMPG_NM: String?
}
