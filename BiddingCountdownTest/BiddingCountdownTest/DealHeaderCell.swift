//
//  DealHeaderCell.swift
//  BiddingCountdownTest
//
//  Created by Angela Smith on 7/30/15.
//  Copyright (c) 2015 Angela Smith. All rights reserved.
//

import UIKit

class DealHeaderCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    //@IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var activityLabel: UILabel!
    
    @IBOutlet var searchView: UIView!
     @IBOutlet var priceView: UIView!

}

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
    }
    
}
