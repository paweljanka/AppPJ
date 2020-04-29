//
//  ListPresenter.swift
//  AppPJ
//
//  Created by Pawel Janka on 29/04/2020.
//  Copyright © 2020 Pawel Janka. All rights reserved.
//

import Foundation

protocol ListPresenting {
    func viewCreated()
    func numberOfSections() -> Int
    func item(forIndex: IndexPath) -> DisplayableItem
}

final class ListPresenter: ListPresenting {

    private let networkProviding: NetworkProviding
    private var displayableItems = [DisplayableItem]()

    weak var view: ListViewScene?

    init(networkProviding: NetworkProviding) {
        self.networkProviding = networkProviding
    }

    // MARK: -  ListPresenting

    func viewCreated() {
        fetchItems()
    }

    func numberOfSections() -> Int {
        return displayableItems.count
    }

    func item(forIndex index: IndexPath) -> DisplayableItem {
        return displayableItems[index.row]
    }

    // MARK: Private Methods

    private func fetchItems() {
        networkProviding.getItems(forLimit: 20) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let items):
                items.forEach {
                    self.displayableItems.append(
                        DisplayableItem(
                            title: $0.title,
                            urlString: $0.url,
                            thumbnailUrlString: $0.thumbnailUrl
                        )
                    )
                }
                self.view?.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
