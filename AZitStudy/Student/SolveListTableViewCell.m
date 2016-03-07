//
//  SolveListTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 26..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "SolveListTableViewCell.h"
#import "SolveListInfo.h"
#import "UIImageView+ImageCache.h"
#import "HTTPAPICommunicator.h"
#import "DateHelper.h"

@implementation SolveListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setSolveInfo:(SolveListInfo *)solveInfo
{
    _solveInfo = solveInfo;
    
    if( [solveInfo.profileImage length] > 0){
        NSURL *imageURL = [[HTTPAPICommunicator sharedInstance] remoteImageURLWithPath:solveInfo.profileImage];
        [_profileImageView setCachedImageFromURL:imageURL placeholderImage:[UIImage imageNamed:@"icon_profile_reply"]];
    }
    _titleLabel.text = solveInfo.title;
    _replyCountLabel.text = [NSString stringWithFormat:@"(%@)",[solveInfo.replyCount stringValue]];
    
    NSString *nameStr = [NSString stringWithFormat:@"%@(고%@)",solveInfo.writerName,[solveInfo.classYear stringValue]];
    NSString *bodyText = [NSString stringWithFormat:@"%@ : %@",nameStr, solveInfo.contents];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:bodyText attributes:@{NSFontAttributeName:_contentsLabel.font}];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14.0] range:NSMakeRange(0, [nameStr length])];
    _contentsLabel.attributedText = attrStr;
    _dateTimeLabel.text = [DateHelper dateStringFromDate:solveInfo.createDate withFormat:@"yyyy-MM-dd HH:mm:ss"];
    _statusButton.hidden = !solveInfo.isAnswered;
}

@end
