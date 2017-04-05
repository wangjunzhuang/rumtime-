//
//  DYModel.h
//  JsonModel
//
//  Created by XiaMenDiyou on 17/3/7.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "KVCNSMutableArr.h"
//#import "NSObject+Model.h"
#import "NSObject+DYlistModel.h"
@interface DYSeconModel : NSObject<ModelDelegate>
@property (strong, nonatomic) NSString *realname;
@property (strong, nonatomic) NSString *username;
@end

@interface DYModel : NSObject
@property (strong, nonatomic) NSString *pig_name;
@property (strong, nonatomic) NSString *realname;
@property (strong, nonatomic) NSString *username;
//@property (strong, nonatomic) NSString *address;
//@property (strong, nonatomic) NSString *pig_age;
@property (strong, nonatomic)  NSArray<DYSeconModel *> *secondModel;
//@property (strong, nonatomic) KVCNSMutableArr *cousins;
-(void)print;
@end


