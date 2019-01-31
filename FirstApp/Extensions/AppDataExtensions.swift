//
//  AppDataExtensions.swift
//  FirstApp
//
//  Created by huynhhq on 1/24/19.
//  Copyright © 2019 huynhhq. All rights reserved.
//

import Foundation

extension AppData{
    
    func storeAppData() {
        do {
            let userDefaults = UserDefaults.standard
            let encodedData: Data? = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: true)
            userDefaults.set(encodedData, forKey: Constants.USER_DEFAULTS_DATA_KEY)
            userDefaults.synchronize()
        } catch {
            print(error)
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(isFirstOpen, forKey: Key.isFirstOpen.rawValue)
        aCoder.encode(targetPoint, forKey: Key.targetPoint.rawValue)
        aCoder.encode(sliderValue, forKey: Key.sliderValue.rawValue)
        aCoder.encode(round, forKey: Key.round.rawValue)
        aCoder.encode(score, forKey: Key.score.rawValue)
        aCoder.encode(successTime, forKey: Key.successTime.rawValue)
        aCoder.encode(image, forKey: Key.image.rawValue)
    }
    
}
