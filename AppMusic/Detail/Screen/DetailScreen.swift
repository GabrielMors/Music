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
    
    public func setDelegate(delegate: DetailScreenProtocol?) {
        self.delegate = delegate
    }
    
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
        delegate?.tappedCloseButton()
    }
    
    init(dataView: CardViewModel) {
        super.init(frame: CGRect())
        self.cardModel = dataView
        DispatchQueue.main.async {
            self.addSubVies()
            self.setupConstraints()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubVies() {
        addSubview(scrollView)
        scrollView.addSubview(cardView)
        scrollView.addSubview(tableView)
        addSubview(closeButton)
    }
    
    private func setupConstraints() {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene}).first?.windows
            .filter({$0.isKeyWindow}).first
        
        let topPadding = window?.safeAreaInsets.top
        
        scrollView.pin(to: self)
        
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
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
    public func configAllDelegate(tableViewDelegate: UITableViewDelegate, tableviewDataSource: UITableViewDataSource, scrollViewDelegate: UIScrollViewDelegate, detailScreenProtocol: DetailScreenProtocol) {
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableviewDataSource
        scrollView.delegate = scrollViewDelegate
        delegate = detailScreenProtocol
    }
}
