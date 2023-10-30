//
//  PlantsViewController.swift
//  5_PlantsAPI
//
//  Created by 박다미 on 2023/10/30.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa


class PlantsViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let tableView = UITableView()
    private let plantService = PlantService()
    private var plants: [Plant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "식물 목록"

        setupTableView()
        bindData()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.register(PlantTableViewCell.self, forCellReuseIdentifier: PlantTableViewCell.reuseIdentifier)
    }

    private func bindData() {
        plantService.getPlants()
            .subscribe(onNext: { [weak self] plants in
                self?.plants = plants
                self?.tableView.reloadData()
            }, onError: { error in
                print("Error: \(error)")
            })
            .disposed(by: disposeBag)
    }
}
