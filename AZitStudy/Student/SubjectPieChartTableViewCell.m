//
//  SubjectPieChartTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIColor+Hex.h>
#import "SubjectPieChartTableViewCell.h"
#import "SubjectGraphInfo.h"
#import "SubjectPieCartInfo.h"
#import "SubjectChartLegendCollectionViewCell.h"

@implementation SubjectPieChartTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _baseView.layer.cornerRadius = 6.0;
    _baseView.layer.masksToBounds = YES;
    _baseView.layer.borderColor = [UIColor colorWithHex:0xe5e5e5].CGColor;
    _baseView.layer.borderWidth = 1.0 / [UIScreen mainScreen].scale;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setGraphInfo:(SubjectGraphInfo *)graphInfo
{
    _graphInfo = graphInfo;
    
    _titleLabel.text = graphInfo.title;
    
    [_pieChartView reset];
    for(SubjectPieCartInfo *value in graphInfo.itemArray){
        [_pieChartView addAngleValue:value.rate andClolor:value.fillColor];
    }
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    _collectionViewHeightLayout.constant = [graphInfo.itemArray count] * 19.0;
    [self layoutIfNeeded];
    [_collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_graphInfo.itemArray count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SubjectChartLegendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    SubjectPieCartInfo *info = [_graphInfo.itemArray objectAtIndex:indexPath.row];
    cell.chartInfo = info;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(collectionView.frame.size.width, 19.0);
}

@end
