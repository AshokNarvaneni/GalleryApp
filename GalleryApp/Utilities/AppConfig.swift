//
//  AppConfig.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 29/02/24.
//

import Foundation

class AppConfig {
    
    func getValue<T>(forInfoDictionaryKey key: String) -> T? {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? T else {
            return nil
        }
        
        return value
    }
    
//    Example Functions
//    func printI<T>(to value: T) -> T? {
//        print("Value:", value)
//        return value
//    }
//    
//    func createKeyValuePair<KeyType, ValueType>(key: KeyType, value: ValueType) -> [KeyType: ValueType] where KeyType: Hashable, ValueType: AnyObject {
//        return [key: value]
//    }
}
