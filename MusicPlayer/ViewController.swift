//
//  ViewController.swift
//  MusicPlayer
//
//  Created by pablo henrique on 15/10/25.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    
    let musics: [String] = ["call"]
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        self.view.backgroundColor = .red
        self.view.addSubview(button)
        setupConstraints()
        
        button.addTarget(self, action: #selector(playSound), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc private func playSound() {
        guard let url = Bundle.main.url(forResource: musics[0], withExtension: "mp3") else {
            print("Sound file not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

