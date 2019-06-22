//
//  BloodGroupNeedView.h
//  TreiVieti
//
//  Created by Ifrim Alexandru on 6/22/19.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BloodGroup.h"

NS_ASSUME_NONNULL_BEGIN

@interface BloodGroupCell : UICollectionViewCell {
    BloodGroup                      *_record;
    
    UILabel                         *_lblBloodGroup;
    UILabel                         *_lblFillPercentage;
    UIColor                         *_fillColor;
}

@property(nonatomic, strong)    BloodGroup              *record;
@end

NS_ASSUME_NONNULL_END
