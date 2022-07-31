//
//  ReminderListViewController.swift
//  rx-today
//
//  Created by Yuta Nakamura on 2022/07/31.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class ReminderListViewController: UIViewController{
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
 
    private var viewModel = ReminderViewModel()
    
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        bindTableData()
        
    }
    
    func bindTableData(){
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)){row, model, cell in
            cell.textLabel?.text = model.title
        }.disposed(by: bag)
        
        viewModel.fetchItems()
    }
    
    
    
}
