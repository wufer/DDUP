//
//  ViewController.m
//  DDP_Wufer
//
//  Created by wufer on 2017/1/20.
//  Copyright © 2017年 wufer. All rights reserved.
//

#import "ViewController.h"
#import "baseValueStudyVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 200, 200)];
    [btn setBackgroundColor:[UIColor yellowColor]];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(baseValue) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)baseValue{
    baseValueStudyVC *vc = [[baseValueStudyVC alloc]init];
    [self  presentViewController:vc animated:YES completion:nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
