//
//  ItemTableViewCell.swift
//  AppPJ
//
//  Created by Pawel Janka on 29/04/2020.
//  Copyright © 2020 Pawel Janka. All rights reserved.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {

    private let thumbnailImageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(withItem item: DisplayableItem) {
        titleLabel.text = item.title
        thumbnailImageView.setImageAndCache(imagePath: item.thumbnailUrlString)
    }

    // MARK: Private methods

    private func layoutViews() {
        setupThumbnailImageView()
        setupTitleLabel()
    }

    private func setupThumbnailImageView() {
        contentView.addSubview(
            thumbnailImageView, constraints: [
                thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0),
                thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6.0),
                thumbnailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6.0),
                thumbnailImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                thumbnailImageView.widthAnchor.constraint(equalToConstant: 60.0)
            ]
        )
        thumbnailImageView.contentMode = .scaleAspectFit
        #warning("fix widthAnchor")
    }

    private func setupTitleLabel() {
        contentView.addSubview(
            titleLabel, constraints: [
                titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 20.0),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0),
                titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ]
        )
        
        titleLabel.textColor = .black
        #warning("create colors palette")
        titleLabel.numberOfLines = 3
    }

}
