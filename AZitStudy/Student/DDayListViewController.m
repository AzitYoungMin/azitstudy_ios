//
//  DDayListViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 3. 4..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "DDayListViewController.h"
#import "DDayListTableViewCell.h"

@interface DDayListViewController ()
@property (strong, nonatomic) NSMutableArray *itemArray;

@end

@implementation DDayListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    return 5;//[_itemArray count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DDayListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    if( [[cell.checkButton allTargets] count] < 1 )
        [cell.checkButton addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - action method

- (void)checkAction:(UIButton*)button
{
    button.selected = !button.selected;
}

- (IBAction)addAction:(id)sender {
}


@end
