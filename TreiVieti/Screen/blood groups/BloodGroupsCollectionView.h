//
//  BloodGroupsCollectionView.h
//  TreiVieti
//
//  Created by Ifrim Alexandru on 6/22/19.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BloodGroup.h"

NS_ASSUME_NONNULL_BEGIN

@interface BloodGroupsCollectionView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    NSArray<BloodGroup *>                   *_bloodGroups;
}

@property(nonatomic, strong)    NSArray                         *bloodGroups;
@end

NS_ASSUME_NONNULL_END
