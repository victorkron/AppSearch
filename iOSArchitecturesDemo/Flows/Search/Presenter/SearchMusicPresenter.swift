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
    
    // MARK: - Private Properties
    
    private let searchService = ITunesSearchService()
    
    // MARK: - Private Functions
    
    private func requestApps(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
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
//        let appDetaillViewController = AppDetailViewController(app: app)
//        self.viewInput?.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
}

// MARK: - SearchViewOutput

extension SearchMusicPresenter: SearchMusicViewOutput {
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestApps(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesSong) {
        self.openAppDetails(with: app)
    }
}
