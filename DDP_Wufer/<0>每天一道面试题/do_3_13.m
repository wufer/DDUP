//
//  do_3_13.m
//  DDP_Wufer
//
//  Created by wufer on 2017/3/13.
//  Copyright © 2017年 wufer. All rights reserved.
//

#import "do_3_13.h"
#import "TextModel.h"

@interface do_3_13 ()

@property (nonatomic,strong)NSMutableArray *arr;

@end

@implementation do_3_13

- (void)viewDidLoad {
    [super viewDidLoad];
    TextModel *str = [[TextModel alloc]init];
    _arr = [NSMutableArray array];
    [_arr addObject:str];
    id temp = [_arr objectAtIndex:0];
    [_arr removeObjectAtIndex:0];
   // NSLog(@"%@",temp);
    
    
    NSArray *testArr = @[@1,@2,@3];
    NSArray *arr1 = [testArr copy];
    NSMutableArray *arr2 = [testArr mutableCopy];
    [arr2 addObject:@4];
    NSLog(@"%ld   %ld ",arr1.count,arr2.count);
  
    NSString* string = @"origion";
    NSString* stringCopy1 = [string copy];
    NSString* stringCopy2 = string;
    NSString* stringCopy3 = [string mutableCopy];
 //   NSLog(@"%p  %p  %p  %p",string,stringCopy1,stringCopy2,stringCopy3);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
