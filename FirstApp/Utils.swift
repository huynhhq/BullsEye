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
            print("Utils:  \(randomValue)")
            if currentValue != randomValue{
                isDuplicated = false
            }
        }
        return randomValue
    }
    
    
}

