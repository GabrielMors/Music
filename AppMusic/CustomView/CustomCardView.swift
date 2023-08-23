//
//  CustomCardView.swift
//  AppMusic
//
//  Created by Gabriel Mors  on 22/08/23.
//

import UIKit

enum ViewMode {
    case full
    case card
}

class CustomCardView: UIView {
    
    //MARK: Propriedades
    var viewMode: ViewMode?
    var containerTopConstraints: NSLayoutConstraint?
    var containerLeadingConstraints: NSLayoutConstraint?
    var containerTrailingConstraints: NSLayoutConstraint?
    var containerBottonConstraints: NSLayoutConstraint?
    var dataModel: CardViewModel?
    
    //MARK: Elementos
    
    // View do Card
    lazy var cardContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius = 20
        return view
    }()
    
    // Imagem sobre o card com um todo
    lazy var cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .black
        return image
    }()
    
    // View que escurece a imagem do card
    lazy var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.6)
        return view
    }()
    
    // Borda que fica sob a imagem de perfil
    lazy var profileBorderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var cardProfilePicture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .black
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    // Botão adicionar imagem do usuário (botão plus)
    lazy var addProfileImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedAddButton() {
        
    }
    
    // Categoria da música
    lazy var cardCategoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    // Data categoria
    lazy var cardCategoryDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // Titulo
    lazy var cardTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 31, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // Gostei e tempo
    lazy var likeEndTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 31, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // Descrição do titulo
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var actionView: CardActionView = {
        let view = CardActionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        let frame = CGRect.zero
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        addSubview(cardContainerView)
        
        cardContainerView.addSubview(cardImage)
        cardContainerView.addSubview(overlayView)
        
        cardContainerView.addSubview(profileBorderView)
        cardContainerView.addSubview(cardProfilePicture)
        cardContainerView.addSubview(addProfileImageButton)
        
        cardContainerView.addSubview(cardCategoryTitleLabel)
        cardContainerView.addSubview(cardCategoryDateLabel)
        cardContainerView.addSubview(cardTitleLabel)
        cardContainerView.addSubview(likeEndTimeLabel)
        cardContainerView.addSubview(descriptionTitleLabel)
        cardContainerView.addSubview(actionView)
        updateLayout(for: viewMode ?? .card)
    }
    
    private func updateLayout(for mode: ViewMode) {
        if mode == .full {
            self.containerTopConstraints?.constant = 0
            self.containerLeadingConstraints?.constant = 0
            self.containerTrailingConstraints?.constant = 0
            self.containerBottonConstraints?.constant = 0
            descriptionTitleLabel.isHidden = false
        } else {
            self.containerTopConstraints?.constant = 15
            self.containerLeadingConstraints?.constant = 30
            self.containerTrailingConstraints?.constant = -30
            self.containerBottonConstraints?.constant = -15
            descriptionTitleLabel.isHidden = true
        }
        actionView.updateLayout(for: mode)
    }
    
    private func setupConstraints() {
        
        containerTopConstraints = cardContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
        containerTopConstraints?.isActive = true
        
        containerLeadingConstraints = cardContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        containerLeadingConstraints?.isActive = true
        
        containerTrailingConstraints = cardContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        containerTrailingConstraints?.isActive = true
        
        containerBottonConstraints = cardContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        containerBottonConstraints?.isActive = true
        
        overlayView.pin(to: self.cardContainerView)
        cardImage.pin(to: self.cardContainerView)
        
        
        NSLayoutConstraint.activate([
            profileBorderView.topAnchor.constraint(equalTo: cardContainerView.topAnchor, constant: 60),
            profileBorderView.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            profileBorderView.widthAnchor.constraint(equalToConstant: 50),
            profileBorderView.heightAnchor.constraint(equalToConstant: 50),
        
            addProfileImageButton.trailingAnchor.constraint(equalTo: profileBorderView.trailingAnchor, constant: 4),
            addProfileImageButton.bottomAnchor.constraint(equalTo: profileBorderView.bottomAnchor, constant: 4),
            addProfileImageButton.widthAnchor.constraint(equalToConstant: 20),
            addProfileImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            cardProfilePicture.centerXAnchor.constraint(equalTo: profileBorderView.centerXAnchor),
            cardProfilePicture.centerYAnchor.constraint(equalTo: profileBorderView.centerYAnchor),
            cardProfilePicture.widthAnchor.constraint(equalToConstant: 40),
            cardProfilePicture.heightAnchor.constraint(equalToConstant: 40),
            
            cardCategoryTitleLabel.topAnchor.constraint(equalTo: profileBorderView.bottomAnchor, constant: 10),
            cardCategoryTitleLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            cardCategoryDateLabel.topAnchor.constraint(equalTo: cardCategoryTitleLabel.bottomAnchor, constant: 2),
            cardCategoryDateLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            cardTitleLabel.topAnchor.constraint(equalTo: cardCategoryDateLabel.bottomAnchor, constant: 20),
            cardTitleLabel.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 20),
            cardTitleLabel.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -20),
            
            likeEndTimeLabel.topAnchor.constraint(equalTo: cardTitleLabel.bottomAnchor, constant: 10),
            likeEndTimeLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: likeEndTimeLabel.bottomAnchor, constant: 30),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 40),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -40),
            
            actionView.bottomAnchor.constraint(equalTo: cardContainerView.bottomAnchor, constant: -20),
            actionView.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 20),
            actionView.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -20),
            actionView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    public func setupView(data: CardViewModel) {
        cardCategoryTitleLabel.text = data.categoryName
        cardCategoryDateLabel.text = data.categoryDate
        cardTitleLabel.text = data.cardTitle
        likeEndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
        descriptionTitleLabel.text = data.cardDescription
        cardImage.image = UIImage(named: data.cardImage ?? "")
        cardProfilePicture.image = UIImage(named: data.categoryImage ?? "")
    }
}
