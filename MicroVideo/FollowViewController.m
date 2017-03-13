//
//  FollowViewController.m
//  MicroVideo
//
//  Created by Zhangzhengang on 17/3/10.
//  Copyright © 2017年 Zhangzhengang. All rights reserved.
//

#import "FollowViewController.h"
#import "UIImageView+WebCache.h"
#import "focusCollectionViewCell.h"

@interface FollowViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *focusList;
}

@end

@implementation FollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489408538915&di=2262ae32cbe183a302006fb00a9a8b20&imgtype=0&src=http%3A%2F%2Fwww.qqjia.com%2Fz%2F09%2Ftu10292_19.jpg
    
    NSString *strImageUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489408538915&di=2262ae32cbe183a302006fb00a9a8b20&imgtype=0&src=http%3A%2F%2Fwww.qqjia.com%2Fz%2F09%2Ftu10292_19.jpg";
    
    //zzg test
    focusList = [[NSMutableArray alloc] initWithObjects:@"推荐",@"新闻",@"头条",@"体育",@"综艺",@"社会", nil];
    
    UICollectionViewFlowLayout *_layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.headerReferenceSize = CGSizeZero;
    _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 80 ,self.view.bounds.size.width, self.view.bounds.size.height - 144) collectionViewLayout:_layout];
    collectionView.backgroundColor = [UIColor clearColor];
    [collectionView registerClass:[focusCollectionViewCell class] forCellWithReuseIdentifier:@"defaultCell"];
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
    return [focusList count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identif = @"defaultCell";
    focusCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identif forIndexPath:indexPath];

    [cell.m_ImageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489408538915&di=2262ae32cbe183a302006fb00a9a8b20&imgtype=0&src=http%3A%2F%2Fwww.qqjia.com%2Fz%2F09%2Ftu10292_19.jpg"]];
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
    return CGSizeMake(60, 80);
}

// header的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 0);
}

// 每行之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 30;
}

// 每行中cell之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 30;
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 30, 0, 30);
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
