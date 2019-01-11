//
//  ModeManger.h
//  排序APP
//
//  Created by Mr.Lin on 18/1/15.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ModeManger : NSObject
@property (strong,readonly) NSMutableArray * ScortArry;
+(instancetype)ShareInstance;

@end
