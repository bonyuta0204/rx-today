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


class ReminderListViewController: UICollectionViewController{
 
    private var viewModel = ReminderViewModel()
    
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = nil
        collectionView.delegate = nil
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        collectionView.register(UICollectionViewListCell.self, forCellWithReuseIdentifier: "cell")

        bindTableData()
        
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    func bindTableData(){
        
        viewModel.items.bind(to: collectionView.rx.items(cellIdentifier: "cell", cellType: UICollectionViewListCell.self)){ row, model, cell in
            var contentConfiguration = cell.defaultContentConfiguration()
            
            contentConfiguration.text = model.title
            cell.contentConfiguration = contentConfiguration

        }.disposed(by: bag)
        
        
        viewModel.fetchItems()
    }
    
    
    
}
