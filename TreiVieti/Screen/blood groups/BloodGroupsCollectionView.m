//
//  BloodGroupsCollectionView.m
//  TreiVieti
//
//  Created by Ifrim Alexandru on 6/22/19.
//  Copyright © 2019 Tudor Turcanu. All rights reserved.
//

#import "BloodGroupsCollectionView.h"
#import "BloodGroupCell.h"

@interface BloodGroupsCollectionView ()

@end


@implementation BloodGroupsCollectionView
@synthesize bloodGroups = _bloodGroups;

static NSString *reuseIdentifier = @"bloodGroup";

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return nil;
    }
    _bloodGroups = @[[BloodGroup groupWithName:@"A" fill:22]
                     , [BloodGroup groupWithName:@"B" fill:17]
                     , [BloodGroup groupWithName:@"AB" fill:65]
                     , [BloodGroup groupWithName:@"0" fill:7]];
    [self commonInit];
    return self;
}
-(id)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *collectionLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionLayout.sectionInset = UIEdgeInsetsMake(0, 10, 5, 10);

    self = [self initWithFrame:frame collectionViewLayout:collectionLayout];
    if (!self) {
        return nil;
    }
    
    return self;
}
-(id)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout {
//    UICollectionViewFlowLayout *collectionLayout = [[UICollectionViewFlowLayout alloc] init];
//    collectionLayout.sectionInset = UIEdgeInsetsMake(0, 10, 5, 10);
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (!self) {
        return nil;
    }

    [self commonInit];
    
    return self;
}
-(void)commonInit {
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = NO;
    [self registerClass:[BloodGroupCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.dataSource = self;
    self.delegate = self;
}

#pragma mark <UICollectionViewDataSource>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_bloodGroups count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BloodGroupCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.record = _bloodGroups[indexPath.row];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    int width = collectionView.frame.size.width - 
    return CGSizeMake(81, collectionView.frame.size.height);
}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//    return 5;

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
