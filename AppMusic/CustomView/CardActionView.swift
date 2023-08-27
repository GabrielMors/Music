//
//  CardActionView.swift
//  AppMusicBF
//
//  Created by Gabriel Mors on 22/08/23.
//

import UIKit

class CardActionView: UIView {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var downloadView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var notInterestedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var playView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var likeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var moreView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.setBackgroundImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()
    
    lazy var notInterestedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.setBackgroundImage(UIImage(named: "restrict")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 35
        button.setBackgroundImage(UIImage(named: "playBtn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.clipsToBounds = true
        return button
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.setBackgroundImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        addSubview(self.stackView)
        
        stackView.addArrangedSubview(self.notInterestedView)
        stackView.addArrangedSubview(self.playView)
        stackView.addArrangedSubview(self.likeView)
        
        downloadView.addSubview(self.downloadButton)
        notInterestedView.addSubview(self.notInterestedButton)
        playView.addSubview(self.playButton)
        likeView.addSubview(self.likeButton)
        moreView.addSubview(self.moreButton)
    }
    
    private func setupContraints() {
        
        self.stackView.pin(to: self)
        
        NSLayoutConstraint.activate([
            
            downloadButton.centerXAnchor.constraint(equalTo: self.downloadView.centerXAnchor),
            downloadButton.centerYAnchor.constraint(equalTo: self.downloadView.centerYAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 45),
            downloadButton.heightAnchor.constraint(equalToConstant: 45),
            
            notInterestedButton.centerXAnchor.constraint(equalTo: self.notInterestedView.centerXAnchor),
            notInterestedButton.centerYAnchor.constraint(equalTo: self.notInterestedView.centerYAnchor),
            notInterestedButton.widthAnchor.constraint(equalToConstant: 45),
            notInterestedButton.heightAnchor.constraint(equalToConstant: 45),
            
            playButton.centerXAnchor.constraint(equalTo: self.playView.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: self.playView.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 70),
            playButton.heightAnchor.constraint(equalToConstant: 70),
            
            likeButton.centerXAnchor.constraint(equalTo: self.likeView.centerXAnchor),
            likeButton.centerYAnchor.constraint(equalTo: self.likeView.centerYAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 45),
            likeButton.heightAnchor.constraint(equalToConstant: 45),
            
            moreButton.centerXAnchor.constraint(equalTo: self.moreView.centerXAnchor),
            moreButton.centerYAnchor.constraint(equalTo: self.moreView.centerYAnchor),
            moreButton.widthAnchor.constraint(equalToConstant: 45),
            moreButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    public func updateLayout(for mode: ViewMode) {
        if mode == .full{
            downloadView.isHidden = false
            moreView.isHidden = false
            
            stackView.addArrangedSubview(self.downloadView)
            stackView.addArrangedSubview(self.notInterestedView)
            stackView.addArrangedSubview(self.playView)
            stackView.addArrangedSubview(self.likeView)
            stackView.addArrangedSubview(self.moreView)
        } else {
            downloadView.isHidden = true
            moreView.isHidden = true
            stackView.removeArrangedSubview(self.downloadView)
            stackView.removeArrangedSubview(self.moreView)
        }
    }
}
