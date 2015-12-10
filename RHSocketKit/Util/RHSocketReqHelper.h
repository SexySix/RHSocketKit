//
//  RHSocketReqHelper.h
//  RHSocketKitDemo
//
//  Created by Ayasofya on 15/12/10.
//  Copyright © 2015年 zhuruhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHSocketReqHelper : NSObject

+ (instancetype)sharedInstance;

- (void)setTimeout;
- (void)addReqWithSerialNum:(int)num;
- (int)getNextReqSerialNum;

@end
