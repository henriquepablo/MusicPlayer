//
//  PlayerViewController.swift
//  MusicPlayer
//
//  Created by pablo henrique on 15/10/25.
//

import Foundation
import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    let contentView = PlayerView()
    var audioPlayer: AVAudioPlayer?
    
    let musics: [String] = ["call"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        contentView.buttonPause.addTarget(self, action: #selector(didTappedPlayMusic), for: .touchUpInside)
    }
    
    private func setup() {
        self.view.backgroundColor = Colors.background
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(contentView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    @objc
    private func didTappedPlayMusic() {
        
        guard let url = Bundle.main.url(forResource: musics[0], withExtension: "mp3") else {
            print("Sound file not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            
            if (audioPlayer?.isPlaying != nil) {
                audioPlayer?.pause()
                return
            }
            
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
}
