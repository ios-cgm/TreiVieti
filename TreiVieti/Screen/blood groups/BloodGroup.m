//
//  BloodGroupNeeded.m
//  TreiVieti
//
//  Created by Ifrim Alexandru on 6/22/19.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

#import "BloodGroup.h"

@implementation BloodGroup
@synthesize groupName = _groupName
,   fillPercentage = _fillPercentage;

+(BloodGroup *)groupWithName:(NSString *)name fill:(int)fillPercentage {
    BloodGroup *group = [[BloodGroup alloc] init];
    group.groupName = name;
    group.fillPercentage = fillPercentage;
    return group;
}
-(void)setFillPercentage:(int)fillPercentage {
    NSParameterAssert(fillPercentage >= 0 && fillPercentage <= 100);
    _fillPercentage = fillPercentage;
}
@end
