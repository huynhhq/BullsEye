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
    var successTime: Int
    var image: String
    static var supportsSecureCoding: Bool = true
    
    enum Key:String {
        case isFirstOpen = "isFirstOpen"
        case targetPoint = "targetPoint"
        case sliderValue = "sliderValue"
        case round = "round"
        case score = "score"
        case successTime = "successTime"
        case image = "image"
    }
    
    init(isFirstOpen: Bool, targetPoint: Int, sliderValue: Int, round: Int, score: Int, successTime: Int, image: String) {
        self.isFirstOpen = isFirstOpen
        self.targetPoint = targetPoint
        self.sliderValue = sliderValue
        self.round = round
        self.score = score
        self.successTime = successTime
        self.image = image
    }

    convenience required init?(coder aDecoder: NSCoder){
        let _isFirstOpen = aDecoder.decodeBool(forKey: Key.isFirstOpen.rawValue)
        let _targetPoint = aDecoder.decodeInteger(forKey: Key.targetPoint.rawValue)
        let _sliderValue = aDecoder.decodeInteger(forKey: Key.sliderValue.rawValue)
        let _round = aDecoder.decodeInteger(forKey: Key.round.rawValue)
        let _score = aDecoder.decodeInteger(forKey: Key.score.rawValue)
        let _successTime = aDecoder.decodeInteger(forKey: Key.successTime.rawValue)
        let _image = aDecoder.decodeObject(forKey: Key.image.rawValue) as! String
        self.init(isFirstOpen: _isFirstOpen
            , targetPoint: _targetPoint
            , sliderValue: _sliderValue
            , round: _round, score: _score
            , successTime: _successTime
            , image: _image)
    }
}
