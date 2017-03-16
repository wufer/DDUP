//
//  GCDStudyVc.m
//  DDP_Wufer
//
//  Created by wufer on 2017/2/20.
//  Copyright © 2017年 wufer. All rights reserved.
//

#import "GCDStudyVc.h"

@interface GCDStudyVc ()

@end

@implementation GCDStudyVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GCDGroup];
    // Do any additional setup after loading the view.
}

-(void)GCDTest{
    
    //dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);  //并行
    dispatch_queue_t queue = dispatch_queue_create("com.queue.new.Queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"1---%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"2--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"3--%@",[NSThread currentThread]);
    });
    
}

-(void)GCDGroup{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        int i = 5;
        while (i--) {
            NSLog(@"组1:%d", i);
            [NSThread sleepForTimeInterval:1];
        }
    });
    dispatch_group_async(group, queue, ^{
        int i = 5;
        while (i--) {
            NSLog(@"组2:%d", i);
            [NSThread sleepForTimeInterval:1];
        }
    });
    dispatch_group_async(group, queue, ^{
        
        int i = 5;
        while (i--) {
            NSLog(@"组3:%d", i);
            [NSThread sleepForTimeInterval:1];
        }
    });
    
    // 最后当所有的任务执行完时通知下面的任务
    dispatch_group_notify(group, queue, ^{
        NSLog(@"所有的任务执行完毕");
    });

    
                        
    
}

-(void)GCD{
    
      
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
