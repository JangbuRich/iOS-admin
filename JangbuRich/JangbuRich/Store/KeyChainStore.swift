//
//  KeyChainStore.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI
import SwiftKeychainWrapper

class KeychainStore {
    
    static let sharedKeychain = KeychainStore()
    
    func saveAccessToken(_ token: String) {
        KeychainWrapper.standard.set(token, forKey: "ACCESS_TOKEN")
    }
    
    func saveRefreshToken(_ token: String) {
        KeychainWrapper.standard.set(token, forKey: "REFRESH_TOKEN")
    }
    
    func getAccessToken() -> String? {
        return KeychainWrapper.standard.string(forKey: "ACCESS_TOKEN")
    }
    
    func getRefreshToken() -> String? {
        return KeychainWrapper.standard.string(forKey: "REFRESH_TOKEN")
    }
    
    func resetAllToken() {
        self.saveAccessToken("")
        self.saveRefreshToken("")
    }
}
