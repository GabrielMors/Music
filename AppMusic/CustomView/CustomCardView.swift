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
}
