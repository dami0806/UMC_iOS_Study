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
    private var cafeData: BehaviorRelay<[Cafe]> = BehaviorRelay(value: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "경상북도 경주시_전망 좋은 카페 현황"
        setupTableView()
        fetchDataFromAPI()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.register(CafeTableViewCell.self, forCellReuseIdentifier: CafeTableViewCell.reuseIdentifier)
        cafeData
                   .bind(to: tableView.rx.items(cellIdentifier: CafeTableViewCell.reuseIdentifier, cellType: CafeTableViewCell.self)) { _, cafe, cell in
                       cell.configure(title: cafe.CAFE_NM, phoneNum: cafe.TELNO ?? "", address: cafe.ADRES)
                   }
                   .disposed(by: disposeBag) 
    }
    
    func fetchDataFromAPI() {
        
        let apiUrl = API_KEY.url
        let apiKey = API_KEY.key
        let parameters: [String: Any] = ["serviceKey": apiKey]
        AF.request(apiUrl, method: .get, parameters: parameters)
                   .responseJSON { [weak self] response in
                       guard let self = self else { return }
                       switch response.result {
                       case .success:
                           if let data = response.data {
                               do {
                                   let response = try JSONDecoder().decode(CafeAPIResponse.self, from: data)
                                   let cafes = response.response.body.items.item
                                   self.cafeData.accept(cafes)
                               } catch {
                            print("JSON Decoding Error: \(error)")
                        }
                    } else {
                        print("No data")
                    }
                case .failure(let error):
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
