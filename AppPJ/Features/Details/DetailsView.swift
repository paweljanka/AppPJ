//
//  DetailsView.swift
//  AppPJ
//
//  Created by Pawel Janka on 29/04/2020.
//  Copyright © 2020 Pawel Janka. All rights reserved.
//

import UIKit

protocol DetailsViewScene: AnyObject {
    func updateView(withItem: DisplayableItem)
}

final class DetailsView: UIViewController, DetailsViewScene {

    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let stackView = UIStackView()
    private let topView = UIView()
    private let bottomView = UIView()

    private let presenter: DetailsPresenting

    init(presenter: DetailsPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Details"
        view.backgroundColor = UIColor.Palette.white
        layoutViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter.viewCreated()
    }

    // MARK: Private Methods

    private func layoutViews() {
        setupStackView()
        setupImageView()
        setupTitleLabel()
    }

    private func setupStackView() {
        view.addSubview(
            stackView, constraints: [
                stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ]
        )
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.addArrangedSubview(topView)
        stackView.addArrangedSubview(bottomView)
    }
    
    private func setupImageView() {
        let constantOffset: CGFloat = 10.0
        
        topView.addSubview(
            imageView, constraints: [
                imageView.topAnchor.constraint(equalTo: topView.topAnchor, constant: constantOffset),
                imageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -constantOffset),
                imageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: constantOffset),
                imageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -constantOffset)
            ]
        )
        imageView.contentMode = .scaleAspectFill
        imageView.corner(withRadius: 8.0)
    }

    private func setupTitleLabel() {
        let constantOffset: CGFloat = 20.0

        bottomView.addSubview(
            titleLabel, constraints: [
                titleLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: constantOffset),
                titleLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -constantOffset),
            ]
        )
        titleLabel.textColor = UIColor.Palette.black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
    }
}

extension DetailsView {
    
    // MARK: - DetailsViewScene

    func updateView(withItem item: DisplayableItem) {
        imageView.setImageAndCache(imagePath: item.urlString)
        titleLabel.text = item.title
    }
}
