//
//  ViewController.m
//  DDP_Wufer
//
//  Created by wufer on 2017/1/20.
//  Copyright © 2017年 wufer. All rights reserved.
//

#import "ViewController.h"
#import "baseValueStudyVC.h"
#import "StringStudyVc.h"
#import "theardStudyVc.h"
#import "GCDStudyVc.h"
#import "InterviewVc.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableV;

@property (nonatomic,strong)NSArray *practiveTypeArr;

@property (nonatomic,strong)NSArray *vcTpyeNameArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableV];
    
}

#pragma mark lazy Loard
-(UITableView *)tableV{
    if (!_tableV) {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.tableFooterView = [UIView new];
    }
    return _tableV;
}

-(NSArray *)practiveTypeArr{
    if (!_practiveTypeArr) {
        _practiveTypeArr = @[@"面试题练习",@"基本数据类型学习",@"字符串数据类型学习",@"thread学习",@"GCD学习"];
    }
    return _practiveTypeArr;
}

-(NSArray *)vcTpyeNameArr{
    if (!_vcTpyeNameArr) {
        _vcTpyeNameArr = @[@"InterviewVc",@"baseValueStudyVC",@"StringStudyVc",@"theardStudyVc",@"GCDStudyVc"];
    }
    return _vcTpyeNameArr;
}

#pragma mark tableView datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.practiveTypeArr.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text  = self.practiveTypeArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *demoClassString = self.vcTpyeNameArr[indexPath.row];
    UIViewController *vc = [[NSClassFromString(demoClassString) alloc]init];
   vc.title = demoClassString;
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
