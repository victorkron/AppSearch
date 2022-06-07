//
//  AppMusicCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Карим Руабхи on 05.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation

struct AppMusicCellModel {
    let title: String
    let subtitle: String?
    let rating: String?
}

final class AppMusicCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> AppMusicCellModel {
        return AppMusicCellModel(title: model.trackName,
                                 subtitle: model.artistName,
                                 rating: model.collectionName)
    }
}
