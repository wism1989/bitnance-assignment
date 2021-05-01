//
//  Example
//  man.li
//
//  Created by man.li on 11/11/2018.
//  Copyright © 2020 man.li. All rights reserved.
//

#import "NSArray+_LeaksFinder.h"

@implementation NSArray(_LeaksFinder)

//是否开启所有属性的检查
- (void)willReleaseIvarList {
    if (!self.count) {
        return;
    }

    for(id ob in self) {
        [ob willReleaseIvarList];
    }
}

- (BOOL)continueCheckObjecClass:(Class)objectClass {
    return YES;
}

@end
