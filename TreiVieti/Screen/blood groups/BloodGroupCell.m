//
//  BloodGroupNeedView.m
//  TreiVieti
//
//  Created by Ifrim Alexandru on 6/22/19.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

#import "BloodGroupCell.h"
#import <TreiVieti-Swift.h>
#import "UIColor+Extensions.h"

@implementation BloodGroupCell
@synthesize record = _record;

-(id)initWithFrame:(CGRect)frame {
    // frame.size.height = 82
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    self.clipsToBounds = NO;
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = 5;
    self.layer.shadowOffset = CGSizeMake(0, 5);
    self.layer.shadowColor = [UIColor colorWithWhite:0 alpha:0.2f].CGColor;
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 5;

    _lblBloodGroup = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, 29)];;
    _lblBloodGroup.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    _lblBloodGroup.textAlignment = NSTextAlignmentCenter;
    _lblBloodGroup.textColor = [UIColor appTextColor];
    _lblBloodGroup.font = [UIFont fontWithName:@"Poppins-Bold" size:30];
    [self addSubview:_lblBloodGroup];
    
    _lblFillPercentage = [[UILabel alloc] initWithFrame:CGRectMake(0, 53, frame.size.width, 29)];;
    _lblFillPercentage.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    _lblFillPercentage.textAlignment = NSTextAlignmentCenter;
    _lblFillPercentage.textColor = [UIColor appTextColor];
    _lblFillPercentage.font = [UIFont fontWithName:@"Poppins-Regular" size:14];
    [self addSubview:_lblFillPercentage];
    
    _fillColor = [UIColor appRedColor];
    
    return self;
}

#pragma mark - draw
-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGRect fillRect = self.bounds;
    fillRect.size.height = roundf(fillRect.size.height * _record.fillPercentage / 100.0f);
    fillRect.origin.y = self.bounds.size.height - fillRect.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    // white fill
    CGPathRef fillPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:5].CGPath;
    CGContextAddPath(context, fillPath);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillPath(context);
    
    // red fill
    fillPath = [UIBezierPath bezierPathWithRoundedRect:fillRect
                      
                                           byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight
                                                 cornerRadii:CGSizeMake(5, 5)].CGPath;
    CGContextAddPath(context, fillPath);
    CGContextSetFillColorWithColor(context, _fillColor.CGColor);
    CGContextFillPath(context);
}

#pragma mark - properties
-(void)setRecord:(BloodGroup *)record {
    _record = record;
    [self refresh];
}
-(void)refresh {
    _lblBloodGroup.text = _record.groupName;
    _lblFillPercentage.text = [NSString stringWithFormat:@"%d%%", _record.fillPercentage];
    [self setNeedsLayout];
}
@end
