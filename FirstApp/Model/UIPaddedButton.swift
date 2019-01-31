//
//  UIPaddedButton.swift
//  FirstApp
//
//  Created by huynhhq on 1/28/19.
//  Copyright © 2019 huynhhq. All rights reserved.
//

import Foundation
import UIKit
public class UIPaddedButton: UIButton {
    
    var gradientLayer = CAGradientLayer()
    
    @IBInspectable var topInset: CGFloat = 0.0
    @IBInspectable var bottomInset: CGFloat = 0.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0
    
    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
}
