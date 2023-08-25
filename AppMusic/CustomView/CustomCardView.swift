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
    var containerTopConstraints: NSLayoutConstraint?
    var containerLeadingConstraints: NSLayoutConstraint?
    var containerTrailingConstraints: NSLayoutConstraint?
    var containerBottomConstraints: NSLayoutConstraint?
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
    lazy var likeAndTimeLabel: UILabel = {
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
    
    init(mode: ViewMode) {
        let frame = CGRect.zero
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
        updateLayout(for: mode)
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
        cardContainerView.addSubview(likeAndTimeLabel)
        cardContainerView.addSubview(descriptionTitleLabel)
        cardContainerView.addSubview(actionView)
    }
    
    private func updateLayout(for mode: ViewMode) {
        if mode == .full {
            self.containerTopConstraints?.constant = 0
            self.containerLeadingConstraints?.constant = 0
            self.containerTrailingConstraints?.constant = 0
            self.containerBottomConstraints?.constant = 0
            descriptionTitleLabel.isHidden = false
        } else {
            self.containerTopConstraints?.constant = 15
            self.containerLeadingConstraints?.constant = 30
            self.containerTrailingConstraints?.constant = -30
            self.containerBottomConstraints?.constant = -15
            descriptionTitleLabel.isHidden = true
        }
        actionView.updateLayout(for: mode)
    }
    
    private func setupConstraints(){
        
        self.containerLeadingConstraints = cardContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        self.containerLeadingConstraints?.isActive = true
        
        self.containerTopConstraints = cardContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
        self.containerTopConstraints?.isActive = true
        
        self.containerBottomConstraints = cardContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        self.containerBottomConstraints?.isActive = true
        
        self.containerTrailingConstraints = cardContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        self.containerTrailingConstraints?.isActive = true
        
        
        self.overlayView.pin(to: self.cardContainerView)
        self.cardImage.pin(to: self.cardContainerView)
        
        
        NSLayoutConstraint.activate([
            self.profileBorderView.topAnchor.constraint(equalTo: self.cardContainerView.topAnchor, constant: 60),
            self.profileBorderView.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            self.profileBorderView.widthAnchor.constraint(equalToConstant: 50),
            self.profileBorderView.heightAnchor.constraint(equalToConstant: 50),
            
            
            self.addProfileImageButton.trailingAnchor.constraint(equalTo: self.profileBorderView.trailingAnchor, constant: 4),
            self.addProfileImageButton.bottomAnchor.constraint(equalTo: self.profileBorderView.bottomAnchor, constant: 4),
            self.addProfileImageButton.widthAnchor.constraint(equalToConstant: 20),
            self.addProfileImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            
            self.cardProfilePicture.centerXAnchor.constraint(equalTo: self.profileBorderView.centerXAnchor),
            self.cardProfilePicture.centerYAnchor.constraint(equalTo: self.profileBorderView.centerYAnchor),
            self.cardProfilePicture.widthAnchor.constraint(equalToConstant: 40),
            self.cardProfilePicture.heightAnchor.constraint(equalToConstant: 40),
            
            
            self.cardCategoryTitleLabel.topAnchor.constraint(equalTo: self.profileBorderView.bottomAnchor, constant: 10),
            self.cardCategoryTitleLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
            
            
            self.cardCategoryDateLabel.topAnchor.constraint(equalTo: self.cardCategoryTitleLabel.bottomAnchor, constant: 2),
            self.cardCategoryDateLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
            
            
            self.cardTitleLabel.topAnchor.constraint(equalTo: self.cardCategoryDateLabel.bottomAnchor, constant: 20),
            self.cardTitleLabel.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 20),
            self.cardTitleLabel.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -20),
            
            
            self.likeAndTimeLabel.topAnchor.constraint(equalTo: self.cardTitleLabel.bottomAnchor, constant: 10),
            self.likeAndTimeLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
            
            self.descriptionTitleLabel.topAnchor.constraint(equalTo: self.likeAndTimeLabel.bottomAnchor, constant: 30),
            self.descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 40),
            self.descriptionTitleLabel.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -40),
            
            
            self.actionView.bottomAnchor.constraint(equalTo: self.cardContainerView.bottomAnchor,constant: -20),
            self.actionView.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor,constant: 20),
            self.actionView.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor,constant: -20),
            self.actionView.heightAnchor.constraint(equalToConstant: 80)
            
        ])
        
        
        
        
    }
    
    public func setupView(data: CardViewModel){
        self.cardCategoryTitleLabel.text = data.categoryName
        self.cardCategoryDateLabel.text = data.categoryDate
        self.cardTitleLabel.text = data.cardTitle
        self.likeAndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
        self.descriptionTitleLabel.text = data.cardDescription
        self.cardImage.image = UIImage(named: data.cardImage ?? "")
        self.cardProfilePicture.image = UIImage(named: data.categoryImage ?? "")
    }
}
