//
//  DetailViewControllerScreen.swift
//  AppMusicBF
//
//  Created by Caio on 23/12/21.
//

import UIKit

protocol DetailScreenProtocol: AnyObject {
    func tappedCloseButton()
}

class DetailScreen: UIView {
    
    var cardModel: CardViewModel?
    var navBarTopAchor: NSLayoutConstraint?
    var playerViewBottomAchor: NSLayoutConstraint?
    
    private weak var delegate:DetailScreenProtocol?
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.autoresizingMask = .flexibleHeight
        view.bounces = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var cardView: CustomCardView = {
        let view = CustomCardView(mode: .full)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cardContainerView.layer.cornerRadius = 0.0
        view.setupView(data: self.cardModel ?? CardViewModel())
        return view
    }()
    
    lazy var navBar: CustomNavBar = {
        let view = CustomNavBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.setupView(data: self.cardModel ?? CardViewModel())
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        return tableView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 15
        button.setBackgroundImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(self.closePressed), for: .touchUpInside)
        return button
    }()
    
    lazy var playerView: CustomPlayerView = {
        let view = CustomPlayerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    @objc func closePressed() {
        self.delegate?.tappedCloseButton()
    }
    
    init(dataView:CardViewModel?) {
        super.init(frame: CGRect())
        cardModel = dataView
        DispatchQueue.main.async {
            self.setupViews()
            self.setupConstraints()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(self.scrollView)
        scrollView.addSubview(self.cardView)
        scrollView.addSubview(self.tableView)
        addSubview(self.navBar)
        addSubview(self.closeButton)
        addSubview(self.playerView)
    }
    
    private func setupConstraints() {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPadding = window?.safeAreaInsets.top
        print(topPadding as Any)
        
        scrollView.pin(to: self)
        
        NSLayoutConstraint.activate([
            
            cardView.topAnchor.constraint(equalTo: self.scrollView.topAnchor,constant: -(topPadding ?? 0)),
            cardView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 500),
            cardView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            
            tableView.topAnchor.constraint(equalTo: self.cardView.bottomAnchor),
            tableView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            tableView.heightAnchor.constraint(equalToConstant: CGFloat((80 * (cardModel?.cardList?.count ?? 0)) + 20)),
            tableView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            tableView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            
            closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
            
            navBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: ((topPadding ?? 0.0) + 80)),
            
            playerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            playerView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        navBarTopAchor = self.navBar.topAnchor.constraint(equalTo: self.topAnchor, constant: -((topPadding ?? 0.0) + 60))
        navBarTopAchor?.isActive = true
        
        playerViewBottomAchor = self.playerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 120)
        playerViewBottomAchor?.isActive = true
    }
    
    public func configAllDelegates(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource, scrollViewDelegate: UIScrollViewDelegate, detailViewScreenDelegate: DetailScreenProtocol) {
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        scrollView.delegate = scrollViewDelegate
        delegate = detailViewScreenDelegate
    }
}
