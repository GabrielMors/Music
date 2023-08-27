//
//  CustomNavBar.swift
//  AppMusicBF
//
//  Created by Gabriel Mors on 22/08/23.
//

import UIKit

class CustomNavBar: UIView {
    
    lazy var categoryTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var cardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var featureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.7)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(self.cardImage)
        addSubview(self.overlayView)
        addSubview(self.categoryTitle)
        addSubview(self.cardTitle)
        addSubview(self.featureLabel)
    }
    
    private func setupConstraints(){
        self.cardImage.pin(to: self)
        self.overlayView.pin(to: self)
        
        NSLayoutConstraint.activate([
            categoryTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            categoryTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            categoryTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            cardTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            cardTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            cardTitle.topAnchor.constraint(equalTo: self.categoryTitle.bottomAnchor,constant: 5),
            
            featureLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            featureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            featureLabel.topAnchor.constraint(equalTo: self.cardTitle.bottomAnchor,constant: 5)
        ])
    }
    
    public func setupView(data: CardViewModel){
        cardTitle.text = data.cardTitle
        categoryTitle.text = data.categoryName
        cardImage.image = UIImage(named: data.cardImage ?? "")
        featureLabel.attributedText = .featureText(data.likeCount ?? "", data.duration ?? "")
    }
    
}
