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
    NSLog(@"1---字符串类型练习");
    NSString *str1 = @"<hello,wo  r d!>";
  //  NSString *str1 = [NSString stringWithString:@"<hello,wo  r d!>"];
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
    
    {  //字符数组转oc字符串
   char *cStr = "hello world";
    NSLog(@"%s",cStr);
    NSString *ocStr = [NSString stringWithUTF8String:cStr];
    NSString *ocStr2 = [NSString stringWithCString:cStr encoding:NSASCIIStringEncoding];
    NSLog(@"ocStr:%@  ocStr2:%@",ocStr,ocStr2);
    }
    
    { //字符串比较
    NSString *astring01 = @"This is A String!";
    NSString *astring02 = @"This is a String!";
    BOOL result = [astring01 isEqualToString:astring02];
    NSLog(@"equal:%d",result);
  
    NSLog(@"compare:%ld",(long)[astring01 compare:astring02 options:NSLiteralSearch]);//-1升序 0 相同 1降序
    char a1 = 'a';
    char A2 = 'A';
    NSLog(@"%d",a1);
    NSLog(@"%d",A2);
  //  NSCaseInsensitiveSearch:不区分大小写比较 NSLiteralSearch:进行完全比较，区分大小写  NSNumericSearch:比较字符串的字符个数，而不是字符值。
    [astring01 caseInsensitiveCompare:astring02];
    }
    {//输入大小写
    NSString *string1 = @"A String";
    NSString *string2 = @"String";
    NSLog(@"string1:%@",[string1 uppercaseString]);//大写
    NSLog(@"string2:%@",[string2 lowercaseString]);//小写
    NSLog(@"string2:%@",[string2 capitalizedString]);//首字母大小
    }
    
    {////查找字符串某处是否包含其它字符串
    NSString *string1 = @"This is a string";
    NSString *string2 = @"string";
    NSRange range = [string1 rangeOfString:string2];
    int location = (int)range.location ;
    int leight = (int)range.length;
    NSString *astring = [[NSString alloc] initWithString:[NSString stringWithFormat:@"Location:%i,Leight:%i",location,leight]];
    NSLog(@"astring:%@",astring);
    }
    
    {//截取字符串
        //从字符串的开头一直截取到指定位置 不包括该位置的字符
        NSString *string1 = @"This is a string";
        NSString *string2 = [string1 substringToIndex:3];
        NSLog(@"string2:%@",string2);
        
        //从指定位置截取 并包括后面全部
        NSString *string3 = [string1 substringFromIndex:3];
        NSLog(@"string3:%@",string3);
        
       //指定位置截取
        NSString *string4 = [string1 substringWithRange:NSMakeRange(0, 4)];
        NSLog(@"string4:%@",string4);
    }
    
    {//字符串拼接 插入
        NSMutableString *string1 = [[NSMutableString alloc]initWithString:@"this is a mutableString"];
        [string1 appendString:@"kidding you"];
        [string1 appendFormat:@"%@ %@",@1,@"one"];
        NSLog(@"%@",string1);
        
        [string1 insertString:@"hi!" atIndex:1];
         [string1 replaceCharactersInRange:NSMakeRange(0, 4) withString:@"helloworld" ];
        NSLog(@"%@",string1);
    }
    
    {//功能性方法
        
        //检查字符串是否以另一个字符串开头
        NSString *string1 = @"This is a normal string.";
        [string1 hasPrefix:@"This"]?NSLog(@"YES"):NSLog(@"NO");
        [string1 hasSuffix:@"string."]?NSLog(@"YES"):NSLog(@"NO");
        
        //扩展路径
        NSString *string2 = @"~/NSData.txt";
        NSString *absolutePath = [string2 stringByExpandingTildeInPath];
        NSLog(@"%@",absolutePath);
        NSLog(@"%@",[string2 stringByDeletingLastPathComponent]);
        
        NSLog(@"%@",[string2 stringByStandardizingPath]);
        NSLog(@"%@",[string2 pathExtension]);//文件扩展名
        NSLog(@"%@",[string2 stringByDeletingPathExtension]);
        
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
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
