//
//  Setting.m
//  striscioni
//
//  Created by GC  on 20/05/14.
//  Copyright (c) 2014 giulio caruso. All rights reserved.
//

#import "Setting.h"

@implementation Setting

-(void)SaveStringNSUD:(NSString *)string andKey:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:string forKey:key];
    [prefs synchronize];
    
}

-(NSString *)RetriveStringNSUD:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *stringRet = [prefs objectForKey:key];
    return stringRet;

}

@end
