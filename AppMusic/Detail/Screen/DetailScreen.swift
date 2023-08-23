//
//  DetailScreen.swift
//  AppMusic
//
//  Created by Gabriel Mors  on 23/08/23.
//

import UIKit

class DetailScreen: UIView {
    
    var cardModel: CardViewModel?
    var navBarTopAnchor: NSLayoutConstraint?
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
//      Deixando uma altura flexivel, ele mesmo se ajusta
        scroll.autoresizingMask = .flexibleHeight
        scroll.bounces = false
        scroll.clipsToBounds = true
        return scroll
    }()
    
    lazy var cardView: CustomCardView = {
        let view = CustomCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionView.updateLayout(for: .full)
        view.cardContainerView.layer.cornerRadius = 0.0
        view.setupView(data: self.cardModel ?? CardViewModel())
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
//        tableView.register(<#T##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        return tableView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        
        button.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedCloseButton() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
