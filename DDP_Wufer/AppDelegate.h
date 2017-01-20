//
//  AppDelegate.h
//  DDP_Wufer
//
//  Created by wufer on 2017/1/20.
//  Copyright © 2017年 wufer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

