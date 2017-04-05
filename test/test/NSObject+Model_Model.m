//
//  NSObject+Model_Model.m
//  test
//
//  Created by XiaMenDiyou on 17/4/1.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

#import "NSObject+Model_Model.h"
#import <objc/message.h>
@implementation NSObject (Model_Model)
// 获取类里面所有方法
// class_copyMethodList(__unsafe_unretained Class cls, unsigned int *outCount)// 本质:创建谁的对象

// 获取类里面属性
//  class_copyPropertyList(<#__unsafe_unretained Class cls#>, <#unsigned int *outCount#>)

// Ivar:成员变量 以下划线开头
// Property:属性
+ (instancetype)model_modelWithDic:(NSDictionary *)dict{
    id objc = [[self alloc]init];
    unsigned int count = 0;
    Ivar *ivarlist = class_copyIvarList(self, &count);
    for (int i = 0 ; i < count; i++) {
        Ivar ivar = ivarlist[i];
        NSString *str = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *typestr = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        NSString *key = [str substringFromIndex:1];
        id value = dict[key];
        
        typestr = [typestr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        typestr = [typestr stringByReplacingOccurrencesOfString:@"@" withString:@""];
       // 二级转换:如果字典中还有字典，也需要把对应的字典转换成模型
        // 判断下value是否是字典,并且是自定义对象才需要转换
        if ([value isKindOfClass:[NSDictionary class]] && ![typestr hasPrefix:@"NS"]) {
            
            // 字典转换成模型 userDict => User模型, 转换成哪个模型
            // 根据字符串类名生成类对象
            Class modelClass = NSClassFromString(typestr);
            
            if (modelClass) { // 有对应的模型才需要转
                // 把字典转模型
                value = [modelClass model_modelWithDic:value];
            }
        }
        
        if (value) {
            [objc setValue:value  forKey:key];
        }
    }
    
    return objc;
}
@end
