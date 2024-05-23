//
//  CustomTableViewCellViewModel.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 22/02/24.
//

import Foundation

struct CustomTableViewCellViewModel {
    let title: String
    let category: String
    let imageUrl: String
    
    init(product: Products) {
        self.title = product.title
        self.category = product.category
        self.imageUrl = product.imageUrl ?? ""
    }
}
