//
//  focusCollectionViewCell.m
//  MicroVideo
//
//  Created by Zhangzhengang on 17/3/13.
//  Copyright © 2017年 Zhangzhengang. All rights reserved.
//

#import "focusCollectionViewCell.h"

@implementation focusCollectionViewCell

@synthesize m_ImageView = _m_ImageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _m_ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        [self.contentView addSubview:_m_ImageView];
    }
    return self;
}

@end
