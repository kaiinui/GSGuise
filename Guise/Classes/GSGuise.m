//
//  GSGuise.m
//  Guise
//
//  Created by kaiinui on 2014/08/29.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "GSGuise.h"

@implementation GSGuise

NSString *const kGSGuiseShardTokenKey = @"GSGuiseShardToken";

+ (unsigned long long int)gid {
    unsigned long long int timestamp = [self timestamp];
    unsigned long long int sequence = [self sequence];
    unsigned long long int shard = [self shard];
    unsigned long long int gid = (timestamp << 22) | (sequence << 10) | shard;
    
    return gid;
}

# pragma mark - Helpers

+ (unsigned long long int)sequence {
    return arc4random_uniform(1 << 13); // 12 bit int
}

+ (int)shard {
    int shard = [[NSUserDefaults standardUserDefaults] integerForKey:kGSGuiseShardTokenKey];
    if (shard) { return shard; }
    shard = arc4random_uniform(1 << 11); // 10 bit int
    [[NSUserDefaults standardUserDefaults] setInteger:shard forKey:kGSGuiseShardTokenKey];
    return shard;
}

+ (unsigned long long int)timestamp {
    return [[NSDate date] timeIntervalSinceReferenceDate] * 1000;
}

@end
