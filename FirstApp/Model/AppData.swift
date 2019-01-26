//
//  AppData.swift
//  FirstApp
//
//  Created by huynhhq on 1/24/19.
//  Copyright © 2019 huynhhq. All rights reserved.
//

import Foundation

class AppData: NSObject, NSCoding, NSSecureCoding{
    
    var isFirstOpen: Bool
    var targetPoint: Int
    var sliderValue: Int
    var round: Int
    var score: Int
    
    static var supportsSecureCoding: Bool = true
    enum Key:String {
        case isFirstOpen = "isFirstOpen"
        case targetPoint = "targetPoint"
        case sliderValue = "sliderValue"
        case round = "round"
        case score = "score"
    }
    
    init(isFirstOpen: Bool, targetPoint: Int, sliderValue: Int, round: Int, score: Int) {
        self.isFirstOpen = isFirstOpen
        self.targetPoint = targetPoint
        self.sliderValue = sliderValue
        self.round = round
        self.score = score
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(isFirstOpen, forKey: Key.isFirstOpen.rawValue)
        aCoder.encode(targetPoint, forKey: Key.targetPoint.rawValue)
        aCoder.encode(sliderValue, forKey: Key.sliderValue.rawValue)
        aCoder.encode(round, forKey: Key.round.rawValue)
        aCoder.encode(score, forKey: Key.score.rawValue)
    }

    convenience required init?(coder aDecoder: NSCoder){
        let _isFirstOpen = aDecoder.decodeBool(forKey: Key.isFirstOpen.rawValue)
        let _targetPoint = aDecoder.decodeInteger(forKey: Key.targetPoint.rawValue)
        let _sliderValue = aDecoder.decodeInteger(forKey: Key.sliderValue.rawValue)
        let _round = aDecoder.decodeInteger(forKey: Key.round.rawValue)
        let _score = aDecoder.decodeInteger(forKey: Key.score.rawValue)
        self.init(isFirstOpen: _isFirstOpen
            , targetPoint: _targetPoint
            , sliderValue: _sliderValue
            , round: _round, score: _score)
    }
    
}
