//
//  MockApiService.swift
//  GalleryAppTests
//
//  Created by Ashok Narvaneni on 17/02/24.
//

import Foundation
@testable import GalleryApp

class MockApiService: ApiServiceProtocol {
    var mockProducts: [Products] = []
    var shouldReturnError = false
    
    
    func postProductDetails(withCompletion completion: @escaping (Result<[Products], Error>) -> Void) {
        print("postProductDetails")
    }
    
    func getProductDetails(withCompletion completion: @escaping (Result<[Products], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey : "Api Failed with error"])))
        } else {
            completion(.success(mockProducts))
        }
        
    }
}
