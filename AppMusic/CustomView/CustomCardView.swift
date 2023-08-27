//
//  CustomCardView.swift
//  AppMusicBF
//
//  Created by Gabriel Mors on 22/08/23.
//

import UIKit

enum ViewMode{
    case full
    case card
}

class CustomCardView: UIView {
    
    //MARK: - PROPRIEDADES
    var containerLeadingConstraints: NSLayoutConstraint?
    var containerTopConstraints: NSLayoutConstraint?
    var containerTrailingConstraints: NSLayoutConstraint?
    var containerBottomConstraints: NSLayoutConstraint?
    var dataModel: CardViewModel?
    
    
    //MARK: - ELEMENTOS
    
    //view do card
    lazy var cardContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 30
        v.clipsToBounds = true
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize(width: 0, height: -2)
        v.layer.shadowRadius = 20
        return v
    }()
    
    //imagem sobre o card como um todo
    lazy var cardImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .black
        return img
    }()
    
    // view que escure a imagem do card
    lazy var overlayView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        return v
    }()
    
    //bordas que fica sob a imagem de perfil
    lazy var profileBorderView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.cornerRadius = 25
        return v
    }()
    
    //imagem do usuario
    lazy var cardProfilePicture: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .black
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        return img
    }()
    
    //botao de adicionar imagem do usuario(botao pluss)
    lazy var addProfileImageButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    //categoria da musica
    lazy var cardCategoryTitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        l.textColor = .white
        return l
    }()
    
    //data categoria
    lazy var cardCategoryDateLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        l.textColor = .white
        return l
    }()
    
    //titulo
    lazy var cardTitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 31, weight: .bold)
        l.textColor = .white
        l.textAlignment = .center
        return l
    }()
    
    //gostei e tempo
    lazy var likeAndTimeLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    //descricao do titulo
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var actionsView: CardActionView = {
        let view = CardActionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(mode: ViewMode){
        let frame = CGRect.zero
        super.init(frame: frame)
        addSubViews()
        setUpConstraints()
        updateLayout(for: mode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubViews(){
        addSubview(self.cardContainerView)
        
        cardContainerView.addSubview(self.cardImage)
        cardContainerView.addSubview(self.overlayView)
        
        cardContainerView.addSubview(self.profileBorderView)
        cardContainerView.addSubview(self.cardProfilePicture)
        cardContainerView.addSubview(self.addProfileImageButton)
        
        cardContainerView.addSubview(self.cardCategoryTitleLabel)
        cardContainerView.addSubview(self.cardCategoryDateLabel)
        cardContainerView.addSubview(self.cardTitle)
        cardContainerView.addSubview(self.likeAndTimeLabel)
        cardContainerView.addSubview(self.descriptionTitleLabel)
        cardContainerView.addSubview(self.actionsView)
        
    }
    
    private func setUpConstraints(){
        
        containerLeadingConstraints = cardContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        containerLeadingConstraints?.isActive = true
        
        containerTopConstraints = cardContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
        containerTopConstraints?.isActive = true
        
        containerBottomConstraints = cardContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        containerBottomConstraints?.isActive = true
        
        containerTrailingConstraints = cardContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        containerTrailingConstraints?.isActive = true
        
        overlayView.pin(to: self.cardContainerView)
        cardImage.pin(to: self.cardContainerView)
        
        
        NSLayoutConstraint.activate([
            profileBorderView.topAnchor.constraint(equalTo: self.cardContainerView.topAnchor, constant: 60),
            profileBorderView.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            profileBorderView.widthAnchor.constraint(equalToConstant: 50),
            profileBorderView.heightAnchor.constraint(equalToConstant: 50),
            
            addProfileImageButton.trailingAnchor.constraint(equalTo: profileBorderView.trailingAnchor, constant: 4),
            addProfileImageButton.bottomAnchor.constraint(equalTo: profileBorderView.bottomAnchor, constant: 4),
            addProfileImageButton.widthAnchor.constraint(equalToConstant: 20),
            addProfileImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            cardProfilePicture.centerXAnchor.constraint(equalTo: self.profileBorderView.centerXAnchor),
            cardProfilePicture.centerYAnchor.constraint(equalTo: self.profileBorderView.centerYAnchor),
            cardProfilePicture.widthAnchor.constraint(equalToConstant: 40),
            cardProfilePicture.heightAnchor.constraint(equalToConstant: 40),
            
            cardCategoryTitleLabel.topAnchor.constraint(equalTo: self.profileBorderView.bottomAnchor, constant: 10),
            cardCategoryTitleLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
            
            cardCategoryDateLabel.topAnchor.constraint(equalTo: self.cardCategoryTitleLabel.bottomAnchor, constant: 2),
            cardCategoryDateLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
            
            cardTitle.topAnchor.constraint(equalTo: self.cardCategoryDateLabel.bottomAnchor, constant: 20),
            cardTitle.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 20),
            cardTitle.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -20),
            
            likeAndTimeLabel.topAnchor.constraint(equalTo: self.cardTitle.bottomAnchor, constant: 10),
            likeAndTimeLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: self.likeAndTimeLabel.bottomAnchor, constant: 30),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 40),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -40),
            
            actionsView.bottomAnchor.constraint(equalTo: self.cardContainerView.bottomAnchor,constant: -20),
            actionsView.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor,constant: 20),
            actionsView.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor,constant: -20),
            actionsView.heightAnchor.constraint(equalToConstant: 80)
            
        ])
    }
    
    private func updateLayout(for mode: ViewMode){
        if mode == .full{
            containerLeadingConstraints?.constant = 0
            containerTopConstraints?.constant = 0
            containerBottomConstraints?.constant = 0
            containerTrailingConstraints?.constant = 0
            descriptionTitleLabel.isHidden = false
        } else {
            containerLeadingConstraints?.constant = 30
            containerTopConstraints?.constant = 15
            containerBottomConstraints?.constant = -15
            containerTrailingConstraints?.constant = -30
            descriptionTitleLabel.isHidden = true
        }
        actionsView.updateLayout(for: mode)
    }
    
    public func setupView(data: CardViewModel){
        cardCategoryTitleLabel.text = data.categoryName
        cardCategoryDateLabel.text = data.categoryDate
        cardTitle.text = data.cardTitle
        likeAndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
        descriptionTitleLabel.text = data.cardDescription
        cardImage.image = UIImage(named: data.cardImage ?? "")
        cardProfilePicture.image = UIImage(named: data.categoryImage ?? "")
    }
}
