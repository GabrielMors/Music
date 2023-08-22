//
//  CardViewTableViewCell.swift
//  AppMusic
//
//  Created by Gabriel Mors  on 21/08/23.
//

import UIKit

class CardViewTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: CardViewTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
