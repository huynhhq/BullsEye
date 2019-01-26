//
//  Utils.swift
//  BullsEye
//
//  Created by huynhhq on 1/23/19.
//  Copyright © 2019 huynhhq. All rights reserved.
//

import Foundation

struct Utils {
    
    static func randomValue(_ currentValue: Int) -> Int {
        var isDuplicated = true
        var randomValue: Int = 0
        while isDuplicated {
            randomValue = Int.random(in: 1...100)
            if currentValue != randomValue{
                isDuplicated = false
            }
        }
        return randomValue
    }
    
    static func getAppData() -> AppData?{
        let userDefaults = UserDefaults.standard
        let decoded = userDefaults.object(forKey: Constants.USER_DEFAULTS_DATA_KEY) ?? nil
        if decoded != nil {
            do {
                let data = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded as! Data) as! AppData
                return data
            } catch{
                fatalError(Constants.kNotEncoded)
            }
        }
        return AppData.init(isFirstOpen: true
            , targetPoint: 0
            , sliderValue: 0
            , round: 0
            , score: 0)
    }
    
    static func calcPoint(data: AppData) -> Int{
        var point: Int = 0
        var minusValue = data.targetPoint - data.sliderValue
        if minusValue < 0 {
            minusValue = data.sliderValue - data.targetPoint
        }
        //print("minusValue: \(minusValue)")
        switch minusValue {
        case 1...Constants.MILESTONE_10:
            point = 9
        case 11...Constants.MILESTONE_20:
            point = 8
        case 21...Constants.MILESTONE_30:
            point = 7
        case 31...Constants.MILESTONE_40:
            point = 6
        case 41...Constants.MILESTONE_50:
            point = 5
        case 51...Constants.MILESTONE_60:
            point = 4
        case 61...Constants.MILESTONE_70:
            point = 3
        case 71...Constants.MILESTONE_80:
            point = 2
        case 81...Constants.MILESTONE_90:
            point = 1
        case 91...Constants.MILESTONE_100:
            point = Constants.MILESTONE_80
        default:
            point = 10
        }
        //print("point: \(point)")
        return point
    }
    
}

