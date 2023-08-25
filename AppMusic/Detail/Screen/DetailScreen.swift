//
//  DetailScreen.swift
//  AppMusic
//
//  Created by Gabriel Mors  on 23/08/23.
//

import UIKit

protocol DetailScreenProtocol: AnyObject {
    func tappedCloseButton()
}

class DetailScreen: UIView {
    
    private weak var delegate: DetailScreenProtocol?
    
    var cardModel: CardViewModel?
    var navBarTopAnchor: NSLayoutConstraint?
    var playerViewBottomAchor: NSLayoutConstraint?
    
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
        let view = CustomCardView(mode: .full)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cardContainerView.layer.cornerRadius = 0.0
        view.setupView(data: self.cardModel ?? CardViewModel())
        return view
    }()
    
    lazy var navBar: CustomNavBar = {
        let v = CustomNavBar()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        v.setupView(data: self.cardModel ?? CardViewModel())
        return v
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
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
        delegate?.tappedCloseButton()
    }
    
    lazy var playerView: CustomPlayerView = {
        let pv = CustomPlayerView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    init(dataView: CardViewModel?) {
       super.init(frame: CGRect())
        self.cardModel = dataView
        DispatchQueue.main.async {
            self.addSubViews()
            self.setupConstraints()
        }
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        addSubview(scrollView)
        scrollView.addSubview(cardView)
        scrollView.addSubview(tableView)
        addSubview(navBar)
        addSubview(closeButton)
        addSubview(playerView)
    }
    
    private func setupConstraints() {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPadding = window?.safeAreaInsets.top
        print(topPadding as Any)
        
        self.scrollView.pin(to: self)
        
        NSLayoutConstraint.activate([
        
            cardView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -(topPadding ?? 0)),
            cardView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 500),
            cardView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            
            tableView.topAnchor.constraint(equalTo: cardView.topAnchor),
            tableView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            tableView.heightAnchor.constraint(equalToConstant: CGFloat((80 * (cardModel?.cardList?.count ?? 0)) + 20)),
            tableView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: ((topPadding ?? 0.0) + 80)),
            
            playerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            playerView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        navBarTopAnchor = self.navBar.topAnchor.constraint(equalTo: self.topAnchor, constant: -((topPadding ?? 0.0) + 60))
        navBarTopAnchor?.isActive = true
        
        playerViewBottomAchor = self.playerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 120)
        playerViewBottomAchor?.isActive = true
    }
    
    public func configAllDelegate(tableViewDelegate: UITableViewDelegate, tableviewDataSource: UITableViewDataSource, scrollViewDelegate: UIScrollViewDelegate, detailScreenProtocol: DetailScreenProtocol) {
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableviewDataSource
        scrollView.delegate = scrollViewDelegate
        delegate = detailScreenProtocol
    }
}
