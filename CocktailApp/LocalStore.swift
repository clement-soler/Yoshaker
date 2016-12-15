//
//  LocalStore.swift
//  CocktailApp
//
//  Created by Clement Soler on 14/12/2016.
//  Copyright © 2016 Clement Soler. All rights reserved.
//

import Foundation

struct LocaleStore {
    
    static let userDefault = UserDefaults.standard
    
    // MARK: - Set
    
    static func setUser(token: String?) {
        userDefault.set(token, forKey: "userToken")
        userDefault.synchronize()
    }
    
    // MARK: - GET
    
    static func getUserToken() -> String? {
        return userDefault.string(forKey: "userToken")
    }
    
    
}
