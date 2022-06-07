//
//  SearchMusicInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Карим Руабхи on 07.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Alamofire
import Darwin

protocol SearchMusicInteractorInput {
    func requestMusic(with query: String, complition: @escaping (Result<[ITunesSong]>) -> Void)
}

class SearchMusicInteractor: SearchMusicInteractorInput {
    
    private static var cache: [String:[ITunesSong]] = [:]
    
    private let searchService = ITunesSearchService()
    
    func requestMusic(with query: String, complition: @escaping (Result<[ITunesSong]>) -> Void) {
        if let apps = SearchMusicInteractor.cache[query] {
            complition(.success(apps))
        } else {
            self.searchService.getSongs(forQuery: query) { result in
                if result.isSuccess {
                    SearchMusicInteractor.cache[query] = result.value
                }
                complition(result)
            }
        }
    }
    
    func clearCacheIfNeeded() {
        if SearchMusicInteractor.cache.keys.count > 20 {
            SearchMusicInteractor.cache = [:]
        }
    }
}
