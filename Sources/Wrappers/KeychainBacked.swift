//
//  KeychainBacked.swift
//  
//
//  Created by Ravil Khusainov on 12.03.2021.
//

import Foundation
import KeychainSwift

@propertyWrapper public struct KeychainBacked {
    
    public let key: String
    private let keychain = KeychainSwift()
    
    public init(key: String) {
        self.key = key
    }
    
    public var wrappedValue: String? {
        get {
            keychain.get(key)
        }
        set {
            if let value = newValue {
                keychain.set(value, forKey: value)
            }
        }
    }
}


