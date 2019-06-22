//
//  UIColor+Extensions.h
//  TreiVieti
//
//  Created by Ifrim Alexandru on 6/22/19.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// Din swift nu-i face export la TreiVieti.h, motiv pt. care trebuie facut separat pentru Objective-C
@interface UIColor (Extensions)
+(UIColor *)appRedColor;
+(UIColor *)appTextColor;
@end

NS_ASSUME_NONNULL_END
