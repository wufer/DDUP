//
//  StringStudyVc.m
//  DDP_Wufer
//
//  Created by wufer on 2017/1/23.
//  Copyright © 2017年 wufer. All rights reserved.
//

#import "StringStudyVc.h"

@interface StringStudyVc ()

@end

@implementation StringStudyVc

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"1---字符串类型练习 分支");
    NSString *str1 = @"<hello,wo  r d!>";
    //删除字符串两端的尖括号
    NSMutableString *mString = [NSMutableString stringWithString:str1];
    //第一个参数是要删除的字符的索引，第二个是从此位开始要删除的位数
    [mString deleteCharactersInRange:NSMakeRange(0, 1)];
    [mString deleteCharactersInRange:NSMakeRange(mString.length-1, 1)];
    NSLog(@"mString:%@",mString);
    
    //删除字符串中的空格
    NSString *str2 = [mString stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"str2:%@",str2);
    
    //同样的可以替换字符
    NSString *str3 = [str2 stringByReplacingOccurrencesOfString:@"," withString:@"好"];
    NSLog(@"str3:%@",str3);
    
    //替换某一位置的字符
    NSString *str4 = [str3 stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@"hello"];
    NSLog(@"str4:%@",str4);
    
    
    // Do any additional setup after loading the view.
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
