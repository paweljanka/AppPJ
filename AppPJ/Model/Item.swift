//
//  Item.swift
//  AppPJ
//
//  Created by Pawel Janka on 29/04/2020.
//  Copyright © 2020 Pawel Janka. All rights reserved.
//

import Foundation

struct Item: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
