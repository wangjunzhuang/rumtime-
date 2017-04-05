//
//  NSObject+DYlistModel.m
//  test
//
//  Created by XiaMenDiyou on 17/4/1.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

#import "NSObject+DYlistModel.h"
#import <objc/runtime.h>
@implementation NSObject (DYlistModel)
+ (instancetype)list_modelWithDic:(NSDictionary *)dict {
    id object = [[self alloc]init];
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    for (int i=0; i<count; i++) {
        Ivar ivar = ivarList[i];
        NSString *string = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *key = [string substringFromIndex:1];
        id value = dict[key];
        NSString *typeStr = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        typeStr = [typeStr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        typeStr = [typeStr stringByReplacingOccurrencesOfString:@"@" withString:@""];
        if ([value isKindOfClass:[NSArray class]]) {
            id bSelf = self;
            Class classModel = [bSelf arrayContainModelClass][key];
            NSMutableArray *temparr = [NSMutableArray new];
            for (NSDictionary *dic in value) {
                [temparr addObject:[classModel list_modelWithDic:dic]];
            }
            value = temparr;
        }
        
        if ([value isKindOfClass:[NSDictionary class]] && [typeStr hasPrefix:@"NS"]) {
            Class classModel = NSClassFromString(typeStr);
            if (classModel) {
                value = [classModel list_modelWithDic:value];
            }
        }
        
        if (value) {
            [object setValue:value forKey:key];
        }
    }
    return object;
}
@end
