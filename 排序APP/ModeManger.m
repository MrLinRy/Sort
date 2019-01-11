//
//  ModeManger.m
//  排序APP
//
//  Created by Mr.Lin on 18/1/15.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "ModeManger.h"

@implementation ModeManger


@synthesize ScortArry = _ScortArry;

static  ModeManger * mInstance;

+(instancetype)ShareInstance
{
    if (mInstance==nil)
    {
        mInstance=[[ModeManger alloc]init];
        
    }
    return mInstance;
}


-(instancetype)init
{
    self=[super init];
    if (self)
    {
        _ScortArry =[[NSMutableArray alloc]init];
        
    }
    return self;
}

@end
