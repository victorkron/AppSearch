//
//  TabBarController.swift
//  iOSArchitecturesDemo
//
//  Created by Карим Руабхи on 05.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private var controllers: [UIViewController]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    init (controllers: [UIViewController]) {
        self.controllers = controllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewControllers = controllers
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
}
