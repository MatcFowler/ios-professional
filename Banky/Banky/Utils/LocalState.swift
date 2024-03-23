//
//  LocalState.swift
//  Banky
//
//  Created by Admin on 2/16/24.
//

import Foundation

public class LocalState {
    
    private enum Keys: String  {
        case hasOnBoarded
    }
    
    public static var hasOnBoarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnBoarded.rawValue)
            
            //just for testing// return false
        }
        set(newValue){
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnBoarded.rawValue)
            UserDefaults.standard.synchronize() // technically not needed, and not needed in newer versions, IOS automatically does it for us
        }
    }
    
    
    
}
