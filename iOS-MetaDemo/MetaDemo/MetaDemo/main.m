//
//  main.m
//  MetaDemo
//
//  Created by YAN on 2017/3/4.
//  Copyright © 2017年 minstone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Greeting : NSObject
/** 局部变量*/
@property(strong , nonatomic) NSString * text ;
- (void)welcome;
@end
@implementation Greeting
- (instancetype)init{
    _text = @"局部变量" ;
    return self ;
}
- (void)welcome{
    NSLog(@"Hello World!") ;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Greeting *my_object = [Greeting new] ;
        NSLog(@"%@",my_object.className) ; // => Greeting
        
    }
    return 0;
}
