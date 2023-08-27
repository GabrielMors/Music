//
//  DetailTableViewCellScreen.swift
//  AppMusicBF
//
//  Created by Gabriel Mors on 24/08/23.
//

import UIKit

class DetailTableViewCellScreen: UIView {
    
    lazy var thumbImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "demo")
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        return image
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste Nome"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var subTitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sub Titulo"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var likeButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "love")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    lazy var moreButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(self.thumbImage)
        addSubview(self.title)
        addSubview(self.subTitle)
        addSubview(self.likeButton)
        addSubview(self.moreButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            thumbImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            thumbImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            thumbImage.heightAnchor.constraint(equalToConstant: 60),
            thumbImage.widthAnchor.constraint(equalToConstant: 60),
            
            title.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor,constant: 15),
            title.topAnchor.constraint(equalTo: self.topAnchor,constant: 17),
            
            subTitle.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor,constant: 15),
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 4),
            
            likeButton.trailingAnchor.constraint(equalTo: moreButton.leadingAnchor,constant: -15),
            likeButton.widthAnchor.constraint(equalToConstant: 35),
            likeButton.heightAnchor.constraint(equalToConstant: 35),
            likeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
            moreButton.widthAnchor.constraint(equalToConstant: 35),
            moreButton.heightAnchor.constraint(equalToConstant: 35),
            moreButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
        ])
    }
    
    public func setupCell(data: CardListModel) {
        title.text = data.listTitle
        subTitle.text = data.listSubtitle
        thumbImage.image = UIImage(named: data.listImage ?? "")
    }
}
