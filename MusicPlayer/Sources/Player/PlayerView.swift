//
//  PlayerView.swift
//  MusicPlayer
//
//  Created by pablo henrique on 15/10/25.
//

import Foundation
import UIKit

class PlayerView: UIView {
    
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Music Player"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = Colors.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "disco"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameMusic: UILabel = {
        let label = UILabel()
        label.text = "Nakhia"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = Colors.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonPause: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "pause"), for: .normal)
        button.tintColor = Colors.white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonPrev: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "prev"), for: .normal)
        button.tintColor = Colors.white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonNext: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "next"), for: .normal)
        button.tintColor = Colors.white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupAnimationDisk()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(title)
        addSubview(imageView)
        addSubview(nameMusic)
        addSubview(buttonPause)
        addSubview(buttonPrev)
        addSubview(buttonNext)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 36),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 110),
            imageView.widthAnchor.constraint(equalToConstant: 350),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            nameMusic.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameMusic.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            
            buttonPause.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonPause.topAnchor.constraint(equalTo: nameMusic.bottomAnchor, constant: 60),
            
            buttonPrev.centerYAnchor.constraint(equalTo: buttonPause.centerYAnchor),
            buttonPrev.trailingAnchor.constraint(equalTo: buttonPause.leadingAnchor, constant: -20),
            
            buttonNext.centerYAnchor.constraint(equalTo: buttonPause.centerYAnchor),
            buttonNext.leadingAnchor.constraint(equalTo: buttonPause.trailingAnchor, constant: 20)

        ])
    }
    
    private func setupAnimationDisk() {
        UIView.animate(withDuration: 10, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
        })
    }
}
