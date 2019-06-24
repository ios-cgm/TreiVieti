//
//  BloodGroupCell.swift
//  TreiVieti
//
//  Created by Ifrim Alexandru on 6/23/19.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

import UIKit

class BloodGroupCell : UICollectionViewCell {
    var record : BloodGroupModel? {
        didSet {
            self.refresh()
        }
    }
    var lblBloodGroup : UILabel?
    var lblFillPercentage : UILabel?
    var fillColor : UIColor = UIColor.appRedColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit();
    }
    func commonInit() {
        self.clipsToBounds = false
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowColor = UIColor(white: 0, alpha: 0.2).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 5
        
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 10, width: frame.self.width, height: 29))
        labelTitle.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        labelTitle.textAlignment = NSTextAlignment.center;
        labelTitle.textColor = UIColor.appTextColor
        labelTitle.font = UIFont(name: "Poppins-Bold", size: 30)
        self.addSubview(labelTitle)
        self.lblBloodGroup = labelTitle
        
        let labelFill = UILabel(frame: CGRect(x: 0, y: 53, width: frame.size.width, height: 29))
        labelFill.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        labelFill.textAlignment = NSTextAlignment.center
        labelFill.textColor = UIColor.appTextColor
        labelFill.font = UIFont(name: "Poppins-Regular", size: 14)
        self.addSubview(labelFill)
        self.lblFillPercentage = labelFill
    }
    
    // MARK: draw
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()!
        
        // white background fill
        var fillPath : CGPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 5).cgPath
        context.addPath(fillPath)
        context.setFillColor(UIColor.white.cgColor)
        context.fillPath()
        
        // red fill
        var fillRect : CGRect = self.bounds;
        fillRect.size.height = CGFloat(roundf(Float(fillRect.size.height * CGFloat(self.record!.fillPercentage) / 100.0)))
        fillRect.origin.y = self.bounds.size.height - fillRect.size.height;
        
        fillPath = UIBezierPath(roundedRect: fillRect
            , byRoundingCorners: [UIRectCorner.bottomLeft, UIRectCorner.bottomRight]
            , cornerRadii: CGSize(width: 5, height: 5)).cgPath
        context.addPath(fillPath);
        context.setFillColor(fillColor.cgColor);
        context.fillPath();
    }
    
    func refresh() {
        self.lblBloodGroup?.text = self.record?.groupName
        self.lblFillPercentage?.text = "\(self.record?.fillPercentage ?? 0)%"
        self.setNeedsLayout();
    }
}
