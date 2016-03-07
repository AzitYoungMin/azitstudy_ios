//
//  PopupSingleSelectViewController.m
//  YPER
//
//  Created by coanyaa on 2015. 12. 7..
//  Copyright © 2015년 joy2x. All rights reserved.
//

#import "PopupSingleSelectViewController.h"
#import "Common.h"
#import "Utility.h"
#import "AppDelegate.h"
#import "SelectItemInfo.h"


@interface PopupSingleSelectViewController ()
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation PopupSingleSelectViewController
- (void)setupView
{
    [super setupView];
    [_tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for(NSInteger i=0; i < [_itemArray count];i++){
        SelectItemInfo *info = [_itemArray objectAtIndex:i];
        if( info.selected ){
            self.selectedIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
            break;
        }
    }
    _tableView.estimatedRowHeight = 44.0;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    if( self.sizeToFit ){
        CGRect appFrame = [[UIScreen mainScreen] bounds];
        CGFloat totalHeight = [_itemArray count] * 44.0;
        if( totalHeight > appFrame.size.height - 40.0 )
            totalHeight = appFrame.size.height - 40.0;
        _tableViewHeightLayout.constant = totalHeight;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_itemArray count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    
    SelectItemInfo *info = [_itemArray objectAtIndex:indexPath.row];
    cell.textLabel.text = info.title;
    cell.accessoryType = ( info.selected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone );
    cell.textLabel.textColor = (info.disabled ? [UIColor lightGrayColor] : [UIColor blackColor] );
    cell.selectionStyle = ( info.disabled ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleBlue );
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ( [Utility systemVersion]>=8.0 ? UITableViewAutomaticDimension : 44.0);
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SelectItemInfo *selInfo = [_itemArray objectAtIndex:indexPath.row];
    if( selInfo.disabled )
        return;
    
    NSIndexPath *prevIndexPath = nil;
    NSMutableArray *indexPaths = [NSMutableArray array];
    if( self.selectedIndexPath )
        prevIndexPath = self.selectedIndexPath;
    if( _selectedIndexPath && _selectedIndexPath.row == indexPath.row )
        prevIndexPath = nil;
    
    self.selectedIndexPath = indexPath;
    if( prevIndexPath )
        [indexPaths addObject:prevIndexPath];
    
    
    for(SelectItemInfo *info in _itemArray)
        info.selected = NO;
    selInfo.selected = YES;
    [indexPaths addObject:indexPath];
    [_tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    
    self.selectedButtonIndex = indexPath.row + self.firstOtherButtonIndex;
    if( self.delegate && [self.delegate respondsToSelector:@selector(popupViewController:didSelectButtonIndex:)])
        [self.delegate popupViewController:self didSelectButtonIndex:self.selectedButtonIndex];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
