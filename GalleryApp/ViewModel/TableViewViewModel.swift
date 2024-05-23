//
//  TableViewViewModel.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 16/02/24.
//

import UIKit

class TableViewViewModel: NSObject {
    
    private var productsArray: [Products] = []
    private let apiService: ApiServiceProtocol
    var tableViewCellViewModelArray: [CustomTableViewCellViewModel] = []
    
    var tempProductsArray: [Products] {
        return productsArray
    }
    
    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    var updateViewWithData: (() -> Void)?
    var onSelectedProduct: ((_ product: Products) -> Void)?
    
    func fetchProductsData() {
        apiService.getProductDetails(withCompletion: { [weak self] result in
            switch result {
                case .success(let prodcts):
                    self?.productsArray = prodcts
                    self?.tableViewCellViewModelArray = self?.productsArray.map({ CustomTableViewCellViewModel(product: $0)}) ?? []
                    DispatchQueue.main.async {
                        self?.updateViewWithData?()
                    }
                case .failure(let error):
                    print("Error: ", error)
                    dump(error)
            }
        })
    }
    
    func selectProduct(index: Int) {
        let product = productsArray[index]
        onSelectedProduct?(product)
    }
    
    func saveDataInKeyChain() {
        let accessToken = "3756238568326589635863583624"
        let dataObj = Data(accessToken.utf8)
        let value = KeyChainHelper.sharedHelper.saveAndUpdateTheItem(data: dataObj, service: KeyChainConstants.accessToken, account: KeyChainConstants.account)
        print("Save Data: ", value)
    }
    

}
