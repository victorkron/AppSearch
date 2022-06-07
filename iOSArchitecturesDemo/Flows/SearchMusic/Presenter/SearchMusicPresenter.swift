//
//  SearchMusicPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Карим Руабхи on 05.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

protocol SearchMusicViewInput: class {
    var searchResults: [ITunesSong] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchMusicViewOutput: class {
    func viewDidSearch(with query: String)
    func viewDidSelectApp(_ app: ITunesSong)
}

class SearchMusicPresenter {
    
    weak var viewInput: (UIViewController & SearchMusicViewInput)?
    let interactor: SearchMusicInteractorInput
    let router: SearchMusicRouterInput
    
    
    // MARK: - Private Properties
    
    private let searchService = ITunesSearchService()
    
    // MARK: - Init
    
    init(interactor: SearchMusicInteractorInput, router: SearchMusicRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Private Functions
    
    private func requestSongs(with query: String) {
        interactor.requestMusic(with: query) { [weak self] result in
            guard let self = self else {
                return
            }
            
            self.viewInput?.throbber(show: false)
            result.withValue { songs in
                guard !songs.isEmpty else {
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResults = songs
            } .withError {
                self.viewInput?.showError(error: $0)
            }
        }
        
    }
    
    private func openAppDetails(with app: ITunesSong) {
        router.openDetails(for: app)
    }
}

// MARK: - SearchViewOutput

extension SearchMusicPresenter: SearchMusicViewOutput {
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestSongs(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesSong) {
        self.openAppDetails(with: app)
    }
}
