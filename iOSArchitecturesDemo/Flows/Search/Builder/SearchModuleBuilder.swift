//
//  SearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Rubtsov on 21.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class SearchModuleBuilder {
    static func build() -> (UITabBarController) {
        let presenter = SearchPresenter()
        let viewController = SearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        if #available(iOS 13.0, *) {
            viewController.tabBarItem = UITabBarItem(title: "Apps", image: UIImage(systemName: "square.stack.3d.up"), selectedImage: UIImage(systemName: "square.stack.3d.up.fill"))
        } else {
            // Fallback on earlier versions
        }
        
        
        let presenterMusic = SearchMusicPresenter()
        let musicViewController = SearchMusicViewController(presenter: presenterMusic)
        presenterMusic.viewInput = musicViewController
        if #available(iOS 13.0, *) {
            musicViewController.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "music.note"), selectedImage: UIImage(systemName: "music.quarternote.3"))
        } else {
            // Fallback on earlier versions
        }
        
        let tabBarController = TabBarController(controllers: [viewController, musicViewController])
        
        
        return tabBarController
    }
}
