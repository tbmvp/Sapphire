//
//  NSString+SPURLAdditions.m
//  Sapphire
//
//  Created by John Wells on 1/26/14.
//  Copyright (c) 2014 John Wells. All rights reserved.
//

#import "NSString+SPURLAdditions.h"

@implementation NSString (SPURLAdditions)

-(BOOL)hasValidURLScheme
{
    for (NSString *scheme in [SPURLFormatter allowedSchemes]) {
        if ([self hasPrefix:scheme]) {
            return YES;
        }
    }
    
    return NO;
}

- (NSString *)fullyEncodedURLString
{
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (__bridge CFStringRef)self,
                                                                                 NULL,
                                                                                 NULL,
                                                                                 kCFStringEncodingUTF8);
}

@end
