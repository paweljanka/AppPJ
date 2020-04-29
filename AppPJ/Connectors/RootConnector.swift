//
//  RootConnector.swift
//  AppPJ
//
//  Created by Pawel Janka on 29/04/2020.
//  Copyright © 2020 Pawel Janka. All rights reserved.
//

import UIKit

final class RootConnector {
    
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func connect() {
        let networkingProvider = Networking()
        let listPresenter = ListPresenter(networkProviding: networkingProvider)
        let listView = ListView(presenter: listPresenter)
        listPresenter.view = listView

        let navigationController = UINavigationController(rootViewController: listView)
        navigationController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
    }

    
}
