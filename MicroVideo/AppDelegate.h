//
//  AppDelegate.h
//  MicroVideo
//
//  Created by Zhangzhengang on 17/3/10.
//  Copyright © 2017年 Zhangzhengang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCTabbarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    CCTabbarController *m_tabbarController;
}

@property (strong, nonatomic) UIWindow           *window;
@property (strong, nonatomic) CCTabbarController *m_tabbarController;


@end

