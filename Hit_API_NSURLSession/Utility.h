//
//  Utility.h
//  Hit_API_NSURLSession
//
//  Created by SILICON on 28/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "Constant.h"
#import <objc/runtime.h>

typedef NS_ENUM(NSUInteger , WeekDay){
    SUNDAY = 1,
    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY
};

@interface Utility : NSObject

+ (BOOL)isInternetConnected_ShowPopupIfNotConnected:(BOOL)showPopup;

@end
