//
//  DYModel.m
//  JsonModel
//
//  Created by XiaMenDiyou on 17/3/7.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

#import "DYModel.h"
#import <objc/runtime.h>
@interface DYModel()

@end
@implementation DYModel

+(NSDictionary *)arrayContainModelClass {
    return @{
             @"secondModel" :[DYSeconModel class],
             };
}

@end

@implementation DYSeconModel


@end
