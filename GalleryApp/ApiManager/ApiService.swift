//
//  ApiService.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 16/02/24.
//

import UIKit

protocol ApiServiceProtocol {
    func getProductDetails(withCompletion completion: @escaping (Result<[Products], Error>) -> Void)
    func postProductDetails(withCompletion completion: @escaping (Result<[Products], Error>) -> Void)
        
}

class ApiService: ApiServiceProtocol {
    
    func postProductDetails(withCompletion completion: @escaping (Result<[Products], Error>) -> Void) {
        print("postProductDetails")
    }
    
    
    func getProductDetails(withCompletion completion: @escaping (Result<[Products], Error>) -> Void) {
        
        guard let urlStr: String = AppConfig().getValue(forInfoDictionaryKey: PlistKeys.BaseUrl),
              let apiKey: String = AppConfig().getValue(forInfoDictionaryKey: PlistKeys.ApiKey) else {
            return
        }
                
        print("urlIS: \(urlStr) APIKey: \(apiKey)")
        guard let urlString = URL(string: urlStr) else {
            return
        }
//        if Reachability.sharedInstance.hasConnectivity() == false {
//            let errorIS = NSError(domain: "Network", code: -1, userInfo: [NSLocalizedDescriptionKey : "No internet connection"])
//            return completion(.failure(errorIS))
//        }
        
        var urlRequest = URLRequest(url: urlString)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            dump(data)
            guard let data = data else {
                let errorIS = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
                completion(.failure(error ?? errorIS))
                return
            }
            let decoder = JSONDecoder()
            do {
                let products = try decoder.decode([Products].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

}
