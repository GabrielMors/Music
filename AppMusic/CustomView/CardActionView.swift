//
//  CardActionView.swift
//  AppMusic
//
//  Created by Gabriel Mors  on 23/08/23.
//

import UIKit

class CardActionView: UIView {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
//      Todos elementos teram o mesmo espaçamento
        stackView.distribution = .fillEqually
        return stackView
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
        button.setBackgroundImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.layer.cornerRadius = 22.5
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedDownloadButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedDownloadButton() {
        
    }
    
    lazy var notInterestedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.setBackgroundImage(UIImage(named: "restrict")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.layer.cornerRadius = 22.5
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedrestrictButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedrestrictButton() {
        
    }
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "playBtn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.layer.cornerRadius = 35
        button.tintColor = .black
        button.addTarget(self, action: #selector(tappedplayButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedplayButton() {
        
    }
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.layer.cornerRadius = 22.5
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedlikeButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedlikeButton() {
        
    }
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.layer.cornerRadius = 22.5
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedmoreButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedmoreButton() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(notInterestedView)
        stackView.addArrangedSubview(playView)
        stackView.addArrangedSubview(likeView)
        
        downloadView.addSubview(downloadButton)
        notInterestedView.addSubview(notInterestedButton)
        playView.addSubview(playButton)
        likeView.addSubview(likeButton)
        moreView.addSubview(moreButton)
    }
    
    private func setupConstraints() {
        
        self.stackView.pin(to: self)
        
        NSLayoutConstraint.activate([
        
            downloadButton.centerXAnchor.constraint(equalTo: downloadView.centerXAnchor),
            downloadButton.centerYAnchor.constraint(equalTo: downloadView.centerYAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 45),
            downloadButton.heightAnchor.constraint(equalToConstant: 45),
            
            notInterestedButton.centerXAnchor.constraint(equalTo: notInterestedView.centerXAnchor),
            notInterestedButton.centerYAnchor.constraint(equalTo: notInterestedView.centerYAnchor),
            notInterestedButton.widthAnchor.constraint(equalToConstant: 45),
            notInterestedButton.heightAnchor.constraint(equalToConstant: 45),
            
            playButton.centerXAnchor.constraint(equalTo: playView.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: playView.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 70),
            playButton.heightAnchor.constraint(equalToConstant: 70),
            
            likeButton.centerXAnchor.constraint(equalTo: likeView.centerXAnchor),
            likeButton.centerYAnchor.constraint(equalTo: likeView.centerYAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 45),
            likeButton.heightAnchor.constraint(equalToConstant: 45),
            
            moreButton.centerXAnchor.constraint(equalTo: moreView.centerXAnchor),
            moreButton.centerYAnchor.constraint(equalTo: moreView.centerYAnchor),
            moreButton.widthAnchor.constraint(equalToConstant: 45),
            moreButton.heightAnchor.constraint(equalToConstant: 45),
        
        ])
    }
    
    public func updateLayout(for mode: ViewMode) {
        if mode == .full {
            downloadView.isHidden = false
            moreView.isHidden = false
            
            stackView.addArrangedSubview(downloadView)
            stackView.addArrangedSubview(notInterestedView)
            stackView.addArrangedSubview(playView)
            stackView.addArrangedSubview(likeView)
            stackView.addArrangedSubview(moreView)
        } else {
            downloadView.isHidden = true
            moreView.isHidden = true
            
            stackView.removeArrangedSubview(downloadView)
            stackView.removeArrangedSubview(moreView)
        }
    }
}