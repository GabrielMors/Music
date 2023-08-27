//
//  CustomPlayerView.swift
//  AppMusicBF
//
//  Created by Gabriel Mors on 22/08/23.
//

import UIKit
import MarqueeLabel

class CustomPlayerView: UIView {
    
    var videoTimer: Timer?
    var time:CGFloat = 0.0
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var marqueeLabel: MarqueeLabel = {
        let label = MarqueeLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 18)
        label.textColor = .white.withAlphaComponent(0.8)
        label.type = .continuous
        label.animationCurve = .linear
        label.fadeLength = 10.0
        label.leadingBuffer = 30.0
        label.trailingBuffer = 30.0
        return label
    }()
    
    lazy var pausePlayBtn: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pause")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white.withAlphaComponent(0.8)
        return image
    }()
    
    lazy var trackBar: UIProgressView = {
        let view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.progressTintColor = .yellow.withAlphaComponent(0.8)
        view.progress = 0.0
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(self.imageView)
        self.addSubview(self.marqueeLabel)
        self.addSubview(self.pausePlayBtn)
        self.addSubview(self.trackBar)
        
        self.videoTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.changeTrackBar), userInfo: nil, repeats: true)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 90),
            
            marqueeLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: 10),
            marqueeLabel.trailingAnchor.constraint(equalTo: pausePlayBtn.leadingAnchor,constant: -5),
            marqueeLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 32),
            
            pausePlayBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            pausePlayBtn.topAnchor.constraint(equalTo: self.topAnchor,constant: 25),
            pausePlayBtn.heightAnchor.constraint(equalToConstant: 40),
            pausePlayBtn.widthAnchor.constraint(equalToConstant: 40),
            
            trackBar.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            trackBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            trackBar.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    @objc func changeTrackBar() {
        time += 0.001
        trackBar.progress = Float(self.time / 120)
        if time >= 120{
            videoTimer?.invalidate()
            videoTimer = nil
        }
    }
    
    public func setupView(data:CardListModel) {
        imageView.image = UIImage(named: data.listImage ?? "")
        marqueeLabel.text = data.listTitle
        time = 0.0
        trackBar.progress = 0.0
        videoTimer = nil
        videoTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.changeTrackBar), userInfo: nil, repeats: true)
    }
}
