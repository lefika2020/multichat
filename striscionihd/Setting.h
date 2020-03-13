//
//  Setting.h
//  striscioni
//
//  Created by GC  on 20/05/14.
//  Copyright (c) 2014 giulio caruso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Setting : NSObject

-(void)SaveStringNSUD:(NSString *)string andKey:(NSString *)key;
-(NSString *)RetriveStringNSUD:(NSString *)key;
@end
