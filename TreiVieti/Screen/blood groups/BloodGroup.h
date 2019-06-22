//
//  BloodGroupNeeded.h
//  TreiVieti
//
//  Created by Ifrim Alexandru on 6/22/19.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BloodGroup : NSObject {
    NSString                    *_groupName;
    int                         _fillPercentage;
}

+(BloodGroup *)groupWithName:(NSString *)name fill:(int)fillPercentage;

@property(nonatomic, strong)    NSString            *groupName;
@property(nonatomic, assign)    int                 fillPercentage;
@end

NS_ASSUME_NONNULL_END
