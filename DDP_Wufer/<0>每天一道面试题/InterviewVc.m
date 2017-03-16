//
//  InterviewVc.m
//  DDP_Wufer
//
//  Created by wufer on 2017/3/13.
//  Copyright © 2017年 wufer. All rights reserved.
//

#import "InterviewVc.h"
#import "do_3_13.h"

@interface InterviewVc ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableV;

@property (nonatomic,strong)NSArray *practiceTimeArr;

@end

@implementation InterviewVc

- (void)viewDidLoad {
    self.title = @"练习";
    [super viewDidLoad];
    [self.view addSubview:self.tableV];
}

-(NSArray *)practiceTimeArr{
    
    if (!_practiceTimeArr) {
        _practiceTimeArr = @[@"do_3_13"];
    }
    return _practiceTimeArr;
}

-(UITableView *)tableV{
    
    if (!_tableV) {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.tableFooterView = [UIView new];
    }
    return _tableV;
}

#pragma mark tableDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.practiceTimeArr.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.practiceTimeArr[indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    baseSubVc *vc = [[NSClassFromString(self.practiceTimeArr[indexPath.row]) alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
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
