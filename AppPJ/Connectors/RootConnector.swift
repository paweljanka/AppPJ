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
    private var navigationController: UINavigationController?

    init(window: UIWindow) {
        self.window = window
    }

    func connect() {
        let networkingProvider = Networking()
        let listPresenter = ListPresenter(networkProviding: networkingProvider, connector: self)
        let listView = ListView(presenter: listPresenter)
        listPresenter.view = listView

        navigationController = UINavigationController(rootViewController: listView)
        navigationController?.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
    }
}

extension RootConnector: DetailsConnecting {

    func presentDetailsView(withItem item: DisplayableItem) {
        let detailsPresenter = DetailsPresenter(selectedItem: item)
        let detailsView = DetailsView(presenter: detailsPresenter)
        detailsPresenter.view = detailsView
        navigationController?.pushViewController(detailsView, animated: true)
    }
}
