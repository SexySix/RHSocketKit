//
//  RHRPCRequest.h
//  RHSocketKitDemo
//
//  Created by Ayasofya on 15/12/10.
//  Copyright © 2015年 zhuruhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHRPCRequest : NSObject
- (instancetype)initWithSerialNumber:(int)serialNum;
- (void)addContent:(NSData *)content;
- (NSData *)convertToData;
@end
