//
//  HomeViewController.h
//  排序APP
//
//  Created by Mr.Lin on 18/1/15.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeViewController : BaseViewController




-(void)InsertSort:(NSArray *)array;

- (void)quickAscendingOrderSort:(NSMutableArray *)arr leftIndex:(NSInteger)left rightIndex:(NSInteger)right;
- (NSInteger)getMiddleIndex:(NSMutableArray *)arr leftIndex:(NSInteger)left rightIndex:(NSInteger)right;

-(void)InsertSSSort:(NSArray *)array;

- (void)heapsortAsendingOrderSort:(NSMutableArray *)ascendingArr;
- (NSMutableArray *)heapCreate:(NSMutableArray *)array;
- (NSMutableArray *)heapAdjast:(NSMutableArray *)items withStartIndex:(NSInteger)startIndex withEndIndex:(NSInteger)endIndex;


- (void)megerSortAscendingOrderSort:(NSMutableArray *)ascendingArr;
- (NSArray *)mergeArrayFirstList:(NSArray *)array1 secondList:(NSArray *)array2 ;


- (void)bubbleAscendingOrderSortWithArray:(NSMutableArray *)ascendingArr;

-(void)bucket_sort:(NSArray *)array;
- (NSMutableArray *)createBucket;
- (NSNumber *)listMaxItem:(NSArray *)list;
- (NSInteger)fetchBaseNumber:(NSNumber *)number digit:(NSInteger)digit;
- (void)radixAscendingOrderSort:(NSMutableArray *)ascendingArr;
@end
