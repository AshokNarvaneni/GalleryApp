//
//  DetailViewModel.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 21/02/24.
//

import Foundation
import UIKit


class DetailViewModel {
    private let product: Products
    
    var title: String {
        return product.title 
    }
    
    var price: String {
        return String(format: "%.2f", product.price)
    }
    
    var description: String {
        return product.desc
    }
    
    var imageUrl: String {
        return product.imageUrl ?? ""
    }
    
    var ratingAndCount: String {
        let rate = String(format: "%.2f", product.rating?.rate ?? 0)
        let count = String(product.rating?.count ?? 0)
        return "$\(rate)(\(count))"
    }
    
    
    init(product: Products) {
        self.product = product
    }
    
    
    func getTheDataFromKeyChain() {
        guard let data = KeyChainHelper.sharedHelper.getTheItem(service: KeyChainConstants.accessToken, account: KeyChainConstants.account) else {
            return
        }
        let accessToken = String(data: data, encoding: .utf8)
        print("Access Token:", accessToken ?? "")
    }
}
