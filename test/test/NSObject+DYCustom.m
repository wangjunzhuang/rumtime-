//
//  NSObject+DYCustom.m
//  test
//
//  Created by XiaMenDiyou on 17/4/1.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

#import "NSObject+DYCustom.h"
#import <objc/message.h>
@implementation NSObject (DYCustom)
+ (instancetype)modelWithDic:(NSDictionary *)dict {
    id objc = [[self alloc]init];
    unsigned int count = 0;
    Ivar *ivarlist = class_copyIvarList(self, &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivarlist[i];
        NSString *str = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *key = [str substringFromIndex:1];
        NSString *value = dict[key];
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    return objc;
}
@end
