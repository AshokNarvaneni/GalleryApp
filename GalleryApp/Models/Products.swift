//
//  Products.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 15/02/24.
//

import UIKit

struct Rating: Codable {
    let rate: Float?
    let count: Int?
}

struct Products: Codable {

    var id: Int64?
    var title: String
    var price: Float
    var desc: String
    var category: String
    var imageUrl: String?
    var rating: Rating?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title
        case price
        case desc = "description"
        case category
        case imageUrl = "image"
        case rating
    }
}
