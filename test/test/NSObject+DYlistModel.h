//
//  NSObject+DYlistModel.h
//  test
//
//  Created by XiaMenDiyou on 17/4/1.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ModelDelegate <NSObject>
@optional
+(NSDictionary *)arrayContainModelClass;
@end
@interface NSObject (DYlistModel)
+ (instancetype)list_modelWithDic:(NSDictionary *)dict ;
@end
