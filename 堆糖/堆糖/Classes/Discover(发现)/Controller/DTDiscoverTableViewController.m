//
//  DTDiscoverTableViewController.m
//  堆糖
//
//  Created by ZYZ on 16/2/25.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "DTDiscoverTableViewController.h"
#import "DTDiscoverCollectionViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "ContentGroupItem.h"
#import "HeaderCollectionReusableView.h"

static NSInteger const cols = 2;
static CGFloat const margin = 30;

#define itemWH ( [UIScreen mainScreen].bounds.size.width - (cols - 1) * margin)/ cols
static NSString * const ID = @"Cell";
static NSString * const Header = @"header";

@interface DTDiscoverTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
/** 第三组Section的Cell*/
@property (weak, nonatomic) IBOutlet UITableViewCell *cell;
/** 数据源数组*/
@property(nonatomic,strong)NSMutableArray<ContentGroupItem *> *collectionData;
/** 总共有几个要显示模型*/
@property(nonatomic,assign)NSUInteger itemsCount;

@property(nonatomic,strong)UICollectionView *collection;

@end

@implementation DTDiscoverTableViewController
- (NSMutableArray *)collectionData{
    if (_collectionData == nil) {
        _collectionData = [NSMutableArray array];
    }
    return _collectionData;
}

- (void)viewDidLoad
{

    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);

    [self loadData];
    [self setUpContenView];
}
- (void)loadData
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    NSMutableDictionary *parametersDict = [NSMutableDictionary dictionary];
/*
 app_code	gandalf
 platform_version	7.0.3
 app_version	6.0 rv:152229
 screen_width	320
 __domain	www.duitang.com
 locale	zh_CN
 screen_height	568
 device_platform	iPhone5,2
 platform_name	iPhone OS
 device_name	iPhone 5
http://203.80.144.212/napi/index/groups/?app_code=gandalf&platform_version=7.0.3&app_version=6.0%20rv%3A152229&screen_width=320&__domain=www.duitang.com&locale=zh_CN&screen_height=568&device_platform=iPhone5%2C2&platform_name=iPhone%20OS&device_name=iPhone%205
    */
    parametersDict[@"app_code"] = @"gandalf";
    parametersDict[@"platform_version"] = @"7.0.3";
    parametersDict[@"app_version"] = @"6.0 rv:152229";
    parametersDict[@"screen_width"] = @"320";
    parametersDict[@"__domain"] = @"www.duitang.com";
    parametersDict[@"locale"] = @"zh_CN";
    parametersDict[@"screen_height"] = @"568";
    parametersDict[@"device_platform"] = @"iPhone5,2";
    parametersDict[@"platform_name"] = @"iPhone OS";
    parametersDict[@"device_name"] = @"iPhone 5";

    [mgr GET:@"http://203.80.144.212/napi/index/groups/" parameters:parametersDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary  *_Nullable responseObject) {
        
        [ContentGroupItem mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"group_items" : @"ContenItems",
                     };
        }];

        NSArray *dictArr = responseObject[@"data"];
        _collectionData = [ContentGroupItem mj_objectArrayWithKeyValuesArray:dictArr];
        

        [self.collection reloadData];
        
        

      
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - 设置内容视图
- (void)setUpContenView
{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(itemWH, 50);
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;

    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 587) collectionViewLayout:layout];

    [collection registerNib:[UINib nibWithNibName:@"HeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Header];

    collection.dataSource = self;
    collection.delegate = self;
    collection.scrollEnabled = NO;
    
    collection.backgroundColor = [UIColor clearColor];
    
    [collection registerNib:[UINib nibWithNibName:@"DTDiscoverCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    self.collection = collection;
    
    [self.cell addSubview:collection];

}
#pragma mark - UICollectionViewDataSource

#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.collectionData.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section ==0||section==1)return 0;
    
    ContentGroupItem *items = self.collectionData[section];
    _itemsCount += items.group_items.count;
    return items.group_items.count;

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DTDiscoverCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    ContentGroupItem *itemGroup = self.collectionData[indexPath.section];
    ContenItems *item = itemGroup.group_items[indexPath.row];
    cell.item = item;
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
       HeaderCollectionReusableView *header =  [_collection dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:Header forIndexPath:indexPath];
       
        return header;
    }
    return nil;
    

}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section ==0||section ==1||section ==2) {
        return  CGSizeMake(self.tableView.frame.size.width, 0);;
    }
    return CGSizeMake(self.tableView.frame.size.width, 50);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 10, 0, 0);
}

#pragma mark - UITableViewDataSource

#pragma mark - UITbaleViewDelegate


#pragma mark - section调整
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 1)
    {
       return @"内容推荐";
    }else if(section == 2)
    {
        return @"图片分类";
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0)return 85;
    if (indexPath.section == 1)return 53;
    if (indexPath.section == 2)return 587;
    return 53;
}

@end
