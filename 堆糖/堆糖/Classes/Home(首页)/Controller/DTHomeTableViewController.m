//
//  DTHomeTableViewController.m
//  堆糖
//
//  Created by ZYZ on 16/2/25.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "DTHomeTableViewController.h"
#import "UIImage+DT.h"
#import "DTIaaViewController.h"

@interface DTHomeTableViewController ()

@end
/*
 "target": "duitang://www.duitang.com/topic/detail/?topic_id=222449",
 "tag": "NEW",
 "stitle": "牛仔衫牛仔裤人人都有，但你又真的会穿吗？",
 "style": "large",
 "content_type": "pgc",
 "image_url": "http://img4q.duitang.com/uploads/people/201602/29/20160229164103_TWHUF.jpeg",
 "enabled_at": 1457269205,
 "enabled_at_str": "2016-03-06 21:00:05",
 "disabled_at": 1488729600,
 "disabled_at_str": "2017-03-06 00:00:00",
 "description": "春天要这样穿牛仔才不算白过",
 "tag_title": "",
 "dynamic_info": "26593次阅读",
 "icon_url": "http://img4q.duitang.com/uploads/people/201601/22/20160122144033_cWnCm.png"
 
 
 
 "target": "duitang://www.duitang.com/home/?tab=shop&animation=1&refresh=1&__urlopentype=pageweb",
 "tag": "NEW",
 "stitle": "",
 "style": "large",
 "content_type": "ad",
 "image_url": "http://img4q.duitang.com/uploads/people/201603/03/20160303144115_KArst.jpeg",
 "enabled_at": 1457269202,
 "enabled_at_str": "2016-03-06 21:00:02",
 "disabled_at": 1457355599,
 "disabled_at_str": "2016-03-07 20:59:59",
 "description": "",
 "tag_title": "",
 "dynamic_info": "推广",
 "icon_url": "http://img4q.duitang.com/uploads/people/201601/22/20160122143952_Az5LT.png"
 
 
 "target": "duitang://www.duitang.com/home/?tab=shop&animation=1&refresh=3&target=http://www.duitang.com/guide/mkt/BlossamAge_coupon/?__urlopentype=pageweb",
 "tag": "NEW",
 "stitle": "女生节福利！堆糖商店时光券快来领。",
 "style": "small",
 "content_type": "ad",
 "image_url": "http://img4q.duitang.com/uploads/people/201603/04/20160304171536_4eUBC.jpeg",
 "enabled_at": 1457269202,
 "enabled_at_str": "2016-03-06 21:00:02",
 "disabled_at": 1457355599,
 "disabled_at_str": "2016-03-07 20:59:59",
 "description": "有券 | 早春大促",
 "tag_title": "",
 "dynamic_info": "推广",
 "icon_url": "http://img4q.duitang.com/uploads/people/201601/22/20160122143952_Az5LT.png"
 
 "target": "duitang://www.duitang.com/album/detail/?id=68927391",
 "tag": "NEW",
 "stitle": "练习一个人的早餐，为了将来，和你一起吃。",
 "style": "small",
 "content_type": "album",
 "image_url": "http://img4q.duitang.com/uploads/people/201602/29/20160229162215_sHaEB.jpeg",
 "enabled_at": 1457269202,
 "enabled_at_str": "2016-03-06 21:00:02",
 "disabled_at": 1488729600,
 "disabled_at_str": "2017-03-06 00:00:00",
 "description": "想和你一起吃早餐",
 "tag_title": "",
 "dynamic_info": "9264人喜欢",
 "icon_url": "http://img4q.duitang.com/uploads/people/201601/22/20160122144011_ExXUY.png"
 
 
 
 */
@implementation DTHomeTableViewController
- (void)viewDidLoad
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithRenderOriginalName:@"nav_icon_add_red"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnOnClick)];
    
}
- (void)leftBtnOnClick
{
    DTIaaViewController *vc = [[DTIaaViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
