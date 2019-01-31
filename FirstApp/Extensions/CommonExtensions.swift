//
//  CommonExtensions.swift
//  FirstApp
//
//  Created by huynhhq on 1/28/19.
//  Copyright © 2019 huynhhq. All rights reserved.
//

import Foundation
import UIKit
extension NSMutableAttributedString {
    
    func setColor(color: UIColor, forText stringValue: String) {
        let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
}

extension UIPaddedLabel {
    
    func setBorderRadiusAll(){
        super.backgroundColor = UIColor.white
        super.layer.cornerRadius = 8
        super.layer.masksToBounds = true
    }
    
    func changeContentAndColor(content: String, color: UIColor, targetContent: String) {
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: content)
        attributedString.setColor(color: color, forText: targetContent)
        self.attributedText = attributedString
    }
}

extension UIPaddedButton
{
    
    func applyGradient(colors: [CGColor])
    {
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
    }
    
}
