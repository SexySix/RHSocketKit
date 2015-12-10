//
//  RHSocketReqHelper.m
//  RHSocketKitDemo
//
//  Created by Ayasofya on 15/12/10.
//  Copyright © 2015年 zhuruhong. All rights reserved.
//

#import "RHSocketReqHelper.h"
#import "RHRPCResponse.h"
@interface RHSocketReqHelper(){
    int reqSerialNum;
    NSMutableDictionary *reqMap;
    int timeout;
}

@property (nonatomic, strong) NSTimer *timer;

@end
@implementation RHSocketReqHelper

+ (instancetype)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        reqSerialNum = 0;
        reqMap = [NSMutableDictionary new];
        self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimeout) userInfo:nil repeats:YES];
    }
    return self;
}

- (int)getNextReqSerialNum{
    reqSerialNum ++;
    if (reqSerialNum > 10000) {
        reqSerialNum = 0;
    }
    return reqSerialNum;
}

- (void)addReqWithSerialNum:(int)num{
    RHRPCResponse *rsp = [RHRPCResponse new];
    NSNumber *key = [NSNumber numberWithInt:num];
    [reqMap setObject:rsp forKey:key];
}

- (void)removeReqWithSerialNum:(int)num{
    NSNumber *key = [NSNumber numberWithInt:num];
    [reqMap removeObjectForKey:key];
}

@end
