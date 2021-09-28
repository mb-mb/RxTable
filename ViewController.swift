//
//  ViewController.swift
//  RxTableView
//
//  Created by marcelo bianchi on 20/08/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    private var viewModel = CarViewModel()
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        bindTableData()
    }
    
    func bindTableData() {
        // bind data to table
        viewModel.items.bind(
            to: tableView.rx.items(cellIdentifier: "cell",
                                   cellType: UITableViewCell.self)
        ) { row, model, cell in
            cell.textLabel?.text = "\(model.id) - \(model.name)"
        }.disposed(by: bag)
                
        // bind model selected handler
        tableView.rx.modelSelected(Car.self).bind { car in
            print(car.id)
        }.disposed(by: bag)
        
        // fetch items
        viewModel.fetchCars()
        
    }


}

