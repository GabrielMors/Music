//
//  CardViewTableViewCell.swift
//  AppMusic
//
//  Created by Gabriel Mors  on 21/08/23.
//

import UIKit

class CardViewTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: CardViewTableViewCell.self)
    
    lazy var cardView: CustomCardView = {
        let view = CustomCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        configConstraints()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func addSubview() {
        contentView.addSubview(cardView)
    }
    
    fileprivate func configConstraints() {
        cardView.pin(to: self)
    }
    
    public func setupCell(data: CardViewModel) {
        cardView.setupView(data: data)
    }
}
