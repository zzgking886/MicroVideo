//
//  mainNavCollectionViewCell.m
//  MicroVideo
//
//  Created by Zhangzhengang on 17/3/13.
//  Copyright © 2017年 Zhangzhengang. All rights reserved.
//

#import "mainNavCollectionViewCell.h"

@implementation mainNavCollectionViewCell
@synthesize m_TextLabel = _m_TextLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _m_TextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
        _m_TextLabel.textColor = [UIColor blackColor];
        _m_TextLabel.textAlignment = NSTextAlignmentCenter;
        _m_TextLabel.backgroundColor = [UIColor clearColor];
        _m_TextLabel.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:_m_TextLabel];
    }
    return self;
}

@end
