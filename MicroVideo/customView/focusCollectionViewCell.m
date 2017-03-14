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
@synthesize m_NameLabel = _m_NameLabel;
@synthesize m_FocusNumberLabel = _m_FocusNumberLabel;
@synthesize m_FocusBtn = _m_FocusBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _m_ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60 * SIZESCALE, 60 * SIZESCALE)];
        [_m_ImageView.layer setCornerRadius:30.0 * SIZESCALE];
        _m_ImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_m_ImageView];
        
        _m_NameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _m_ImageView.frame.origin.y + _m_ImageView.frame.size.height + 3, 60 * SIZESCALE, 20 * SIZESCALE)];
        _m_NameLabel.textColor = [UIColor blackColor];
        _m_NameLabel.font = [UIFont systemFontOfSize:14.0 * SIZESCALE];
        _m_NameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_m_NameLabel];
        
        _m_FocusNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _m_NameLabel.frame.origin.y + _m_NameLabel.frame.size.height, 60 * SIZESCALE, 20 * SIZESCALE)];
        _m_FocusNumberLabel.textColor = [UIColor grayColor];
        _m_FocusNumberLabel.font = [UIFont systemFontOfSize:10 * SIZESCALE];
        _m_FocusNumberLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_m_FocusNumberLabel];
        
        _m_FocusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _m_FocusBtn.frame = CGRectMake(5 * SIZESCALE, _m_FocusNumberLabel.frame.origin.y + _m_FocusNumberLabel.frame.size.height, 50 * SIZESCALE, 20 * SIZESCALE);
        [_m_FocusBtn setTitle:@"+" forState:UIControlStateNormal];
        [_m_FocusBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_m_FocusBtn.layer setBorderWidth:2.0f];
        [_m_FocusBtn.layer setBorderColor:[UIColor orangeColor].CGColor];
        [self.contentView addSubview:_m_FocusBtn];
    }
    return self;
}

@end
