//
//  GSViewController.m
//  Guise
//
//  Created by kaiinui on 2014/08/29.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "GSViewController.h"
#import "GSGuise.h"

@interface GSViewController ()

@end

@implementation GSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (int i=0; i < 20; i++) {
        unsigned long long int gid = [GSGuise gid];
        NSLog(@"%lld", gid);
        NSLog(@"%@", [self intToBinary:gid]);
        sleep(0.001);
    }
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSString *)intToBinary:(long long)intValue
{
    long long byteBlock = 8,    // 8 bits per byte
    totalBits = sizeof(long long) * byteBlock, // Total bits
    binaryDigit = 1;  // Current masked bit
    
    // Binary string
    NSMutableString *binaryStr = [[NSMutableString alloc] init];
    
    do
    {
        // Check next bit, shift contents left, append 0 or 1
        [binaryStr insertString:((intValue & binaryDigit) ? @"1" : @"0" ) atIndex:0];
        
        // More bits? On byte boundary ?
        if (--totalBits && !(totalBits % byteBlock))
            [binaryStr insertString:@"|" atIndex:0];
        
        // Move to next bit
        binaryDigit <<= 1;
        
    } while (totalBits);
    
    // Return binary string
    return binaryStr;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
