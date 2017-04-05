//
//  ViewController.m
//  test
//
//  Created by XiaMenDiyou on 17/3/27.
//  Copyright © 2017年 XiaMenDiyou. All rights reserved.
//

#import "ViewController.h"
#import "DYModel.h"
#import "NSObject+DYlistModel.h"
@interface ViewController () {
    DYModel  *model;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 //  NSDictionary * dic = @{@"secondModel":@[@{@"username":@"傻瓜",@"realname":@"王麻子"},@{@"username":@"傻瓜2",@"realname":@"王麻子2"}],@"pig_name":@"傻鸟",@"pig_age":@"12"};

    NSDictionary * dic = @{@"secondModel":@{@"username":@"傻瓜",@"realname":@"王麻子"},@"pig_name":@"傻鸟",@"pig_age":@"12"};
//    NSDictionary * dic = @{@"username":@"傻瓜",@"realname":@"王麻子",@"pig_name":@"傻鸟",@"pig_age":@"12"};
    //NSDictionary * dic = @{@"pig_name":@"傻鸟",@"pig_age":@"12"};
//    model = [[DYModel alloc]init];
//    model.pig_name = @"111";
    
    model = [DYModel list_modelWithDic:dic];
   // DYSeconModel *secondModel = model.secondModel;
    NSArray *arr = model.secondModel;
    DYSeconModel *secondModel = arr[1];
    NSLog(@"%@",secondModel.realname);

}

@end
