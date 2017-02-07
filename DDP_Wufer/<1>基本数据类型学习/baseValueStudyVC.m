//
//  baseValueStudyVC.m
//  DDP_Wufer
//
//  Created by wufer on 2017/2/6.
//  Copyright © 2017年 wufer. All rights reserved.
//

#import "baseValueStudyVC.h"

@interface baseValueStudyVC ()

@end

@implementation baseValueStudyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"1---基本数据类型练习");
    /**基本数据
    1>.整形 int
    2.>浮点型
          1.float 单精度
          2. double 双精度
    3>.字符型 char
    */
    
    /**类型限定修饰词
     short短型，修饰int、double；
     long长型，修饰int、double；
     signed有符号型，修饰int、char；
     unsigned 无符号型，修饰int、char；
     1.这些限定词经常用来限定int型，在限定int类型时int可以省略；
     2.short和long会改变int型的长度，在不同编译器长度不相同，但是一般short长度不大于int，int长度不大于long；
     3.signed和unsigned不会改变类型长度，仅表示最高位是否为符号位，其中unsigned表示大于等于0的正数；
     
     int：-2147483648～2147483647   -2^32 ~ 2^32-1
     unsigned int：0～4294967295      2^33-1
     short：-32768～32767
     unsigned short：0～65535
     long： -2147483648～2147483647  -2^32 ~ 2^32-1
     unsigned long：0～4294967295
     
     
     数据类型	16位编译器 	32位编译器 	64位编译器
     char	                1byte	          1byte               	1byte
     int	                    2byte	           4byte             	4byte
     float	                4byte	             4byte	             4byte
     double	             8byte	             8byte              	8byte
     short int	             2byte	             2byte	             2byte
     unsigned  int	     2byte             	4byte             	4byte
     long	                 4byte	             4byte             	8byte
     unsigned   long	4byte	             4byte	             8byte
     long long	        8byte	            8byte	             8byte
     */
    
    
    
    /**
     NSInterger
     
     #if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
     typedeflong NSInteger;
     typedefunsigned long NSUInteger;
     #else
     typedefint NSInteger;
     typedefunsigned int NSUInteger;
     #endif   
     
     1.当需要使用int类型的变量的时候，可以像写C的程序一样，用int，也可以用NSInteger，但更推荐使用NSInteger，因为这样就不用考虑设备是32位的还是64位的。
     2.NSUInteger是无符号的，即没有负数,NSInteger是有符号的。
     */
    
    
    //各个类型的字节长度
    [self sizeOf];
   
}

-(void)sizeOf{
    NSLog(@"The size of an int is: %lu bytes.",sizeof(int));
    NSLog(@"The size of a short int is: %lu bytes.",sizeof(short int));
    NSLog(@"The size of a long int is: %lu bytes.",sizeof(long int));
    NSLog(@"the size of a long long int is: %lu bytes",sizeof(long long int));
    NSLog(@"The size of a char is: %lu bytes.",sizeof(char));
    NSLog(@"The size of a float is: %lu bytes.",sizeof(float));
    NSLog(@"The size of a double is: %lu bytes.",sizeof(double));
    NSLog(@"The size of a bool is: %lu bytes.",sizeof(bool));
    NSLog(@"The size of an NSInterger is %lu bytes.",sizeof(NSInteger));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
