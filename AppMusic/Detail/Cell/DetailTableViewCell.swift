//
//  DetailTableViewCell.swift
//  AppMusicBF
//
//  Created by Caio on 30/12/21.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static public let identifier:String = String(describing: DetailTableViewCell.self)
    
    var screen: DetailTableViewCellScreen = DetailTableViewCellScreen()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(self.screen)
    }
    
    private func setupConstraints() {
        screen.pin(to: self.contentView)
    }
    
    public func setupCell(data: CardListModel) {
        screen.setupCell(data: data)
    }
}
