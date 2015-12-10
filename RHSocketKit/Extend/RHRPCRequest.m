//
//  RHRPCRequest.m
//  RHSocketKitDemo
//
//  Created by Ayasofya on 15/12/10.
//  Copyright © 2015年 zhuruhong. All rights reserved.
//

#import "RHRPCRequest.h"

@interface RHRPCRequest()

@property (nonatomic) int serialNumber;
@property (nonatomic, strong) NSData *body;

@end

@implementation RHRPCRequest

- (instancetype)initWithSerialNumber:(int)mSerialNum{
    self = [super init];
    if (self) {
        self.serialNumber = mSerialNum;
    }
    return self;
}

- (void)addContent:(NSData *)content{
    self.body = content;
}

- (NSData *)convertToData{
    NSMutableData *senddata = [NSMutableData new];
    NSString *head = [NSString stringWithFormat:@"RHRPC/%d\n",self.serialNumber];
    NSData *head_data = [head dataUsingEncoding:NSUTF8StringEncoding];
    [senddata appendData:head_data];
    
    if (self.body.length>0) {
        [senddata appendData:self.body];
    }
    
    
    return senddata;
}

@end
