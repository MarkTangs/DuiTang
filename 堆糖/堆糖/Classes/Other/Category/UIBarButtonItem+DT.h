//
//  UIBarButtonItem+DT.h
//  堆糖
//
//  Created by ZYZ on 16/3/16.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (DT)
+(UIBarButtonItem *)barButtonItemWithNorImage:(UIImage *)Norimage andHighlightImage:(UIImage *)Higimage Target:(id)target action:(SEL)action Title:(NSString *)title;
@end
