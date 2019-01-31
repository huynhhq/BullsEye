//
//  ViewControllerExtensions.swift
//  FirstApp
//
//  Created by huynhhq on 1/31/19.
//  Copyright © 2019 huynhhq. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let consecutiveTimes = Utils.getConsecutiveTimesCurrernt()
        return consecutiveTimes != nil ? consecutiveTimes! : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = consecutiveTimesCV.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? cTimesCollectionViewCell
        cell?.checkCTimes.text = ""
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellCount = Utils.getConsecutiveTimesCurrernt()!
        let collectionViewWidth = consecutiveTimesCV.bounds.width
        
        let totalCellWidth = Constants.kCellWidth * Double(cellCount)
        let totalSpacingWidth = Constants.kCellSpacing * (Double(cellCount) - 1)
        
        let leftInset = (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.height, height: collectionView.bounds.height)
    }

}
