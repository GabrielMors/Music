//
//  HomeViewControllerScreen.swift
//  AppMusicBF
//
//  Created by Gabriel Mors on 24/08/23.
//

import UIKit

class HomeViewControllerScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CardViewTableViewCell.self, forCellReuseIdentifier: CardViewTableViewCell.identifier)
        return tableView
    }()
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.tableView)
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        self.tableView.pin(to: self)
    }
}
