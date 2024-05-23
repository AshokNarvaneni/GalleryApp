//
//  KeyChainHelper.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 28/02/24.
//

import Foundation
import Security

class KeyChainHelper {
    static let sharedHelper = KeyChainHelper()
    
    func saveAndUpdateTheItem(data:Data, service: String, account: String) -> Bool {
        let saveQuery = [kSecAttrService: service, kSecAttrAccount: account, kSecClass: kSecClassGenericPassword, kSecValueData:data] as CFDictionary
        
        // Saving the new value in keychains
        var status = SecItemAdd(saveQuery, nil)

        if status == errSecDuplicateItem {
            // Updating the existing value in keychains
            let updateQuery = [kSecAttrService: service, kSecAttrAccount: account, kSecClass: kSecClassGenericPassword] as CFDictionary
            let dataIS = [kSecValueData: data] as CFDictionary
            
            status = SecItemUpdate(updateQuery, dataIS)
            print("saveAndUpdateTheItem  -- update: ", status)
            if status != errSecSuccess {
                return false
            }
        } else if status != errSecSuccess {
            print("saveAndUpdateTheItem  -- failed: ", status)
            return false
        }
        print("saveAndUpdateTheItem  -- Success")
        return true
    }
    
    // To fetch the stored data in Keychains
    func getTheItem(service: String, account: String) -> Data? {
        let getQuery = [kSecAttrService: service, kSecAttrAccount: account, kSecClass: kSecClassGenericPassword, kSecReturnData: true] as CFDictionary
        var result: AnyObject? = nil
        let status = SecItemCopyMatching(getQuery, &result)
        if status != errSecSuccess {
            return nil
        }
        print("getTheItem -- ", status)
        return result as? Data
    }
    
    // To delete the particular item in Keychains
    func deleteTheItem(service: String, account: String) -> Bool {
        let deleteQuery = [kSecAttrService: service, kSecAttrAccount: account, kSecClass: kSecClassGenericPassword] as CFDictionary
        
        let status = SecItemDelete(deleteQuery)
        if status != errSecSuccess {
            return false
        }
        return true
    }
    
    
}
