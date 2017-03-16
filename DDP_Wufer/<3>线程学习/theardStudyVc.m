//
//  theardStudyVc.m
//  DDP_Wufer
//
//  Created by wufer on 2017/2/20.
//  Copyright © 2017年 wufer. All rights reserved.
//

#import "theardStudyVc.h"

@interface theardStudyVc ()

@property (nonatomic,assign)int ticketCount;

@property (nonatomic,strong)NSThread *ticketer1;

@property (nonatomic,strong)NSThread *ticketer2;

@end

@implementation theardStudyVc

- (void)viewDidLoad {
    NSLog(@"%@",[NSThread currentThread]);
    [super viewDidLoad];
    [self threadTest];
   // [self sellTicket];
}

-(void)threadTest{
    __block int count = 5;
    NSThread *thread1= [[NSThread alloc]initWithBlock:^{
        NSLog(@"线程1开始执行  %@", [NSThread currentThread]);
        
        while (count--) {
            NSLog(@"%d",count);
            if (count ==2) {
                //取消标记 但是并不会取消线程
                [[NSThread currentThread] cancel];
            }
            if ([[NSThread currentThread] isCancelled]) {
                //回到主线程刷新UI
                [self performSelectorOnMainThread:@selector(reloadUI) withObject:nil waitUntilDone:NO];
                NSLog(@"线程结束");
                //真正的结束线程
                [NSThread exit];
            }
        }
    }];
    thread1.name = @"doSomeThing";
    //手动开启
    [thread1 start];
    
    //线程结束的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(threadfinishTask:) name:NSThreadWillExitNotification object:nil];
    
}

-(void)sellTicket{
    self.ticketCount = 10;
    self.ticketer1 = [[NSThread alloc]initWithTarget:self selector:@selector(threadLock) object:nil];
    self.ticketer2 = [[NSThread alloc]initWithTarget:self selector:@selector(threadLock) object:nil];
    self.ticketer2.name = @"wufer";
    [self.ticketer1 start];
    [self.ticketer2 start];
    
}
-(void)threadLock{
    while (1) {
        @synchronized (self) {
            int count = self.ticketCount;
            if (count > 0) {
                [NSThread sleepForTimeInterval:0.002];
                self.ticketCount = count-1;
                NSThread *current = [NSThread currentThread];
                NSLog(@"%@----还剩%d张票",current,self.ticketCount);
                if ([[NSThread currentThread].name isEqualToString:@"wufer"]) {
                    [NSThread sleepForTimeInterval:1.0];
                }
            }
        }
        if (self.ticketCount == 0) {
            NSLog(@"exit");
            [NSThread exit];
        }
    }
}
-(void)threadUnlock{
    while (1) {
            int count = self.ticketCount;
            if (count > 0) {
                [NSThread sleepForTimeInterval:0.002];
                self.ticketCount = count-1;
                NSThread *current = [NSThread currentThread];
                NSLog(@"%@----还剩%d张票",current,self.ticketCount);
            }
        if (self.ticketCount == 0) {
            NSLog(@"exit");
            [NSThread exit];
        }
    }
}



- (void)reloadUI
{
    self.view.backgroundColor = [UIColor redColor];
}

- (void)threadfinishTask:(NSNotification *)notification{
    
    NSLog(@"threadfinishTask");
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
