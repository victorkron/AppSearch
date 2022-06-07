//
//  MusicDetailsViewModel.swift
//  iOSArchitecturesDemo
//
//  Created by Карим Руабхи on 07.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

struct ProgressLabel {
    var progressValue: Double
}


class MusicDetailsViewModel {
    
    let progress = Observable<ProgressLabel>(ProgressLabel(progressValue: 0))
    let song: ITunesSong
    var timer: Timer?
    var songLength = 29.0 // 29 - продолжительность всех демо версий песен

    weak var viewController: UIViewController? {
        didSet {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setProgress), userInfo: nil, repeats: true)
        }
    }
    
    
    // MARK: - Init
    
    init(song: ITunesSong) {
        self.song = song
    }
    
    // MARK: - Private Function
    
    @objc
    private func setProgress() {
        if progress.value.progressValue < 100 {
            let newValue = progress.value.progressValue + 100 / songLength
            progress.value.progressValue = newValue > 100 ? 100 : round(100 * newValue) / 100
        } else {
            timer?.invalidate()
        }
    }
    
    // MARK: - Public Function
    
    func getUrl() -> URL? {
        guard
            let urlString = song.previewUrl,
            let url = URL(string: urlString)
        else { return nil }
        
        return url
    }
    
}
