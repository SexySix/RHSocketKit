//
//  RHSocketDelimiterEncoder.m
//  RHToolkit
//
//  Created by zhuruhong on 15/6/30.
//  Copyright (c) 2015年 zhuruhong. All rights reserved.
//

#import "RHSocketDelimiterEncoder.h"
#import "RHSocketConfig.h"

@implementation RHSocketDelimiterEncoder

- (instancetype)init
{
    if (self = [super init]) {
        _maxFrameSize = 8192;
        _delimiter = 0xff;
    }
    return self;
}

- (void)encodePacket:(id<RHSocketPacketContent>)packet encoderOutput:(id<RHSocketEncoderOutputDelegate>)output
{
    NSData *data = [packet data];
    NSAssert(data.length < _maxFrameSize, @"Encode data is too long ...");
    
    NSMutableData *sendData = [NSMutableData dataWithData:data];
    [sendData appendBytes:&_delimiter length:1];
    NSTimeInterval timeout = [packet timeout];
    NSInteger tag = [packet tag];
    
    RHSocketLog(@"tag:%ld, timeout: %f, sendData: %@", (long)tag, timeout, sendData);
    [output didEncode:sendData timeout:timeout tag:tag];
}

@end
