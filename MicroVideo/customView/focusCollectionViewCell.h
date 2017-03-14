//
//  focusCollectionViewCell.h
//  MicroVideo
//
//  Created by Zhangzhengang on 17/3/13.
//  Copyright © 2017年 Zhangzhengang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface focusCollectionViewCell : UICollectionViewCell

@property (nonatomic, retain) UIImageView *m_ImageView;
@property (nonatomic, retain) UILabel     *m_NameLabel;
@property (nonatomic, retain) UILabel     *m_FocusNumberLabel;
@property (nonatomic, retain) UIButton    *m_FocusBtn;

@end
