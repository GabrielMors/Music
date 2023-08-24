//
//  DetailTableViewCell.swift
//  AppMusicBF
//
//  Created by Gabriel Mors  on 23/08/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: DetailTableViewCell.self)
    
    var screen:DetailTableViewCellScreen = DetailTableViewCellScreen()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.contentView.addSubview(self.screen)
    }
    
    private func setupConstraints(){
        self.screen.pin(to: self.contentView)
    }
    
    public func setupCell(data: CardListModel){
        self.screen.setupCell(data: data)
    }
    
    
}
