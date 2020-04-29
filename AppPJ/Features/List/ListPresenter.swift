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
    func selectedItem(indexPath: IndexPath)
    func fetchNewItems(forIndexPath: IndexPath)
}

final class ListPresenter: ListPresenting {

    private let networkProviding: NetworkProviding
    private let connector: DetailsConnecting
    private var displayableItems = [DisplayableItem]()
    private var fetchingItemsLimit = 0

    weak var view: ListViewScene?

    init(networkProviding: NetworkProviding, connector: DetailsConnecting) {
        self.networkProviding = networkProviding
        self.connector = connector
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

    func selectedItem(indexPath: IndexPath) {
        let selectedItem = displayableItems[indexPath.row]
        connector.presentDetailsView(withItem: selectedItem)
    }

    func fetchNewItems(forIndexPath indexPath: IndexPath) {
        if indexPath.row == displayableItems.count - 1 {
            fetchingItemsLimit += 20
            fetchItems()
        }
    }

    // MARK: Private Methods

    private func fetchItems() {
        networkProviding.getItems(forLimit: fetchingItemsLimit) { [weak self] result in
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
