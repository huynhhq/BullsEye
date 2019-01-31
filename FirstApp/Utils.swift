//
//  Utils.swift
//  BullsEye
//
//  Created by huynhhq on 1/23/19.
//  Copyright © 2019 huynhhq. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

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
            , round: 1
            , score: 0
            , successTime: 0
            , image: Constants.kDefaultImage)
    }
    
    static func calcPoint(data: AppData) -> (point: Int, isSuccess: Bool, isPassedRound: Bool){
        var point: Int = 0
        let gameRule = getRuleFromRound(data.round)
        let minusValue = (data.targetPoint > data.sliderValue) ? (data.targetPoint - data.sliderValue) : (data.sliderValue - data.targetPoint)
        let isSuccess = (minusValue < gameRule!.rangePoint) ? true : false
        let isPassedRound = ((gameRule!.consecutiveTimes - data.successTime == 1) && isSuccess) ? true : false
        switch minusValue {
        case 1...10:
            point = 9
        case 11...20:
            point = 8
        case 21...30:
            point = 7
        case 31...40:
            point = 6
        case 41...50:
            point = 5
        case 51...60:
            point = 4
        case 61...70:
            point = 3
        case 71...80:
            point = 2
        case 81...90:
            point = 1
        case 91...100:
            point = 0
        default:
            point = 10
        }
        return (point: point, isSuccess: isSuccess, isPassedRound: isPassedRound)
    }
    
    static func getImageFromRound(_ round: Int) -> String{
        let gameRule = getRuleFromRound(round)
        if(gameRule != nil){
            return gameRule!.image
        }
        return Constants.kDefaultImage
    }
    
    static func getConsecutiveTimesCurrernt() -> Int?{
        let appData = getAppData()
        return getRuleFromRound(appData!.round)?.consecutiveTimes
    }
    
    private static func getRuleFromRound(_ round: Int) -> GameRulesEnum?{
        switch round {
        case 1:
            return GameRulesEnum.Round_1
        case 2:
            return GameRulesEnum.Round_2
        case 3:
            return GameRulesEnum.Round_3
        case 4:
            return GameRulesEnum.Round_4
        case 5:
            return GameRulesEnum.Round_5
        case 6:
            return GameRulesEnum.Round_6
        case 7:
            return GameRulesEnum.Round_7
        case 8:
            return GameRulesEnum.Round_8
        case 9:
            return GameRulesEnum.Round_9
        case 10:
            return GameRulesEnum.Round_10
        case 11:
            return GameRulesEnum.Round_11
        case 12:
            return GameRulesEnum.Round_12
        case 13:
            return GameRulesEnum.Round_13
        case 14:
            return GameRulesEnum.Round_14
        case 15:
            return GameRulesEnum.Round_15
        default:
            return nil
        }
    }
    
    static func assignbackground(imageName: String, imageView: UIImageView){
        let background = UIImage(named: imageName)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.image = background
    }

}

