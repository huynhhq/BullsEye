//
//  GameRulesEnum.swift
//  FirstApp
//
//  Created by huynhhq on 1/29/19.
//  Copyright © 2019 huynhhq. All rights reserved.
//

import Foundation

typealias tupleRule = (Int, Int)

enum GameRulesEnum {
    
    case Round_1
    case Round_2
    case Round_3
    case Round_4
    case Round_5
    case Round_6
    case Round_7
    case Round_8
    case Round_9
    case Round_10
    case Round_11
    case Round_12
    case Round_13
    case Round_14
    case Round_15
    
    private static let associatedValues = [
        Round_1: (consecutive_times: 2, range_point: 15, image: "1.jpg"),
        Round_2: (consecutive_times: 3, range_point: 15, image: "2.jpg"),
        Round_3: (consecutive_times: 4, range_point: 15, image: "3.jpg"),
        Round_4: (consecutive_times: 5, range_point: 10, image: "4.jpg"),
        Round_5: (consecutive_times: 6, range_point: 10, image: "5.jpg"),
        Round_6: (consecutive_times: 7, range_point: 10, image: "6.jpg"),
        Round_7: (consecutive_times: 8, range_point: 8, image: "7.jpg"),
        Round_8: (consecutive_times: 9, range_point: 8, image: "8.jpg"),
        Round_9: (consecutive_times: 10, range_point: 8, image: "9.jpg"),
        Round_10: (consecutive_times: 11, range_point: 7, image: "10.jpg"),
        Round_11: (consecutive_times: 12, range_point: 7, image: "11.jpg"),
        Round_12: (consecutive_times: 13, range_point: 7, image: "12.jpg"),
        Round_13: (consecutive_times: 14, range_point: 5, image: "13.jpg"),
        Round_14: (consecutive_times: 15, range_point: 5, image: "14.jpg"),
        Round_15: (consecutive_times: 16, range_point: 5, image: "15.jpg")
    ]
    
    var consecutiveTimes: Int{
        return GameRulesEnum.associatedValues[self]!.consecutive_times
    }
    
    var rangePoint: Int {
        return GameRulesEnum.associatedValues[self]!.range_point
    }
    
    var image: String {
        return GameRulesEnum.associatedValues[self]!.image
    }
}
