//
//  DetailsPresenter.swift
//  AppPJ
//
//  Created by Pawel Janka on 29/04/2020.
//  Copyright © 2020 Pawel Janka. All rights reserved.
//

import Foundation

protocol DetailsPresenting {
    func viewCreated()
}

final class DetailsPresenter: DetailsPresenting {

    private let selectedItem: DisplayableItem

    init(selectedItem: DisplayableItem) {
        self.selectedItem = selectedItem
    }

    weak var view: DetailsViewScene?
    
    // MARK: - DetailsPresenting

    func viewCreated() {
        view?.updateView(withItem: selectedItem)
    }
}
