//
//  ViewController.swift
//  ScalableAPIClientDemo
//
//  Created by David on 09/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class AppListController: UITableViewController {

    private var appCellId = "appCellId"
    fileprivate var items: [ListDisplayable]?
    var dataProvider: ListDisplayableDataProvider = AppsManager()
    
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        refresher.addTarget(self, action: #selector(reloadTable), for: .valueChanged)
        return refresher
    }()
    
    @objc private func reloadTable() {
        dataProvider.getListItems { (fetchedItems) in
            self.items = fetchedItems
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refresher.endRefreshing()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Top Free Apps"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.register(AppCell.self, forCellReuseIdentifier: appCellId)
    
        view.backgroundColor = .white
        
        tableView.refreshControl = refresher
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        reloadTable()
    }


}

extension AppListController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: appCellId, for: indexPath)
        
        if let appCell = cell as? AppCell {
            
            if let cellItem = items?[indexPath.row] {
                appCell.nameLabel.text = cellItem.listItemTitle
                appCell.genreLabel.text = cellItem.listItemSubtitle
                appCell.appIconImageView.image = cellItem.thumbnailImage
            }
            
            return appCell
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}



