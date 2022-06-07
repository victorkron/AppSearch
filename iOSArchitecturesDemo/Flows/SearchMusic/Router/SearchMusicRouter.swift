//
//  SearchMusicRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Карим Руабхи on 07.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

protocol SearchMusicRouterInput {
    func openDetails(for music: ITunesSong)
    func openMusicInItunes(_ music: ITunesSong)
}

class SearchMusicRouter: SearchMusicRouterInput {
    
    weak var viewController: UIViewController?
    
    func openDetails(for music: ITunesSong) {
        let viewModel = MusicDetailsViewModel(song: music)
        let musicDetailsViewController = MusicDetailsViewController(viewModel: viewModel)
        viewModel.viewController = musicDetailsViewController
        viewController?.navigationController?.pushViewController(musicDetailsViewController, animated: true)
    }
    
    func openMusicInItunes(_ music: ITunesSong) {
        guard
            let urlString = music.previewUrl,
            let url = URL(string: urlString)
        else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
