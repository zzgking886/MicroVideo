//
//  MainViewController.m
//  MicroVideo
//
//  Created by Zhangzhengang on 17/3/10.
//  Copyright © 2017年 Zhangzhengang. All rights reserved.
//

#import "MainViewController.h"
#import "HttpServerHelper.h"
#import "mainNavCollectionViewCell.h"

@interface MainViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *categoryList;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    //http://172.20.156.35:8000/vrtablelist
    [HttpServerHelper httpRequestWithUrl:@"http://www.cntv.cn/nettv/adp/online/test/adlist_new_ios.js" andRequestType:HTTP_GET andParamters:nil andFinishBlock:^(id resultData, BOOL isError) {
        if (isError == NO)
        {
//            NSLog(@"result = %@", resultData);
        }
    }];
    
    //zzg test
    categoryList = [[NSMutableArray alloc] initWithObjects:@"推荐",@"新闻",@"头条",@"体育",@"综艺",@"社会",@"搞笑",@"音乐",@"生活",@"影视",@"娱乐",@"呆萌",@"游戏",@"原创",@"开眼", nil];
    
    UICollectionViewFlowLayout *_layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.headerReferenceSize = CGSizeZero;
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20 ,self.view.bounds.size.width, 44) collectionViewLayout:_layout];
    collectionView.backgroundColor = [UIColor clearColor];
    [collectionView registerClass:[mainNavCollectionViewCell class] forCellWithReuseIdentifier:@"defaultCell"];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:collectionView];
    if (self.m_bViewControllerInTest)
    {
        collectionView.backgroundColor = [UIColor greenColor];
    }
}


#pragma mark -
#pragma mark UICollectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [categoryList count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identif = @"defaultCell";
    mainNavCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identif forIndexPath:indexPath];
    cell.m_TextLabel.text = [NSString stringWithFormat:@"%@", [categoryList objectAtIndex:indexPath.item]];
    
    
    if (self.m_bViewControllerInTest)
    {
        cell.contentView.backgroundColor = [UIColor redColor];
    }
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectItem %d", indexPath.item);
}


#pragma mark - 
#pragma mark UICollectionFlowLayout delegate
// cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(50, 44);
}

// header的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 0);
}

// 每行之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

// 每行中cell之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 6.0;
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
